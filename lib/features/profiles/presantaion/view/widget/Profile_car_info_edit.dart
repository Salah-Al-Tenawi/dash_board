import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecars/features/profiles/data/model/enum/image_mode.dart';
import 'package:sharecars/features/profiles/domain/entity/car_entity.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/car_color_input_tile.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/car_name_input_tile.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/car_seats_input_tile.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/car_switch_smoking.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_car_image_picker.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/radio_switch_tile.dart';
class ProfileCarInfoEdit extends StatefulWidget {
  final CarEntity? carWithEdit;

  const ProfileCarInfoEdit({super.key, required this.carWithEdit});

  @override
  State<ProfileCarInfoEdit> createState() => _ProfileCarInfoEditState();
}

class _ProfileCarInfoEditState extends State<ProfileCarInfoEdit> {
  late TextEditingController carName;
  late TextEditingController colorCar;
  late TextEditingController seatsCar;
  late bool hasRadio;
  late bool allowsSmoking;
  String? carImage;

  @override
  void initState() {
    super.initState();
    final car = widget.carWithEdit;

    carName = TextEditingController(text: car?.type ?? "");
    colorCar = TextEditingController(text: car?.color ?? "");
    seatsCar = TextEditingController(text: car?.seats?.toString() ?? "");
    hasRadio = car?.hasRadio ?? false;
    allowsSmoking = car?.allowsSmoking ?? false;
    carImage = car?.image;
  }

  @override
  void dispose() {
    carName.dispose();
    colorCar.dispose();
    seatsCar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final car = widget.carWithEdit;
    if (car == null) {
      return const Text("لا توجد بيانات سيارة بعد.");
    }

    return Column(
      children: [
        ProfileCarImagePicker(
          carImage: carImage,
          onPick: () => _onPickImage(context),
        ),
        CarNameInputTile(
          controller: carName,
          onChanged: (val) => car.type = val,
        ),
        Row(
          children: [
            Expanded(
              child: CarColorInputTile(
                controller: colorCar,
                onChanged: (val) => car.color = val,
              ),
            ),
            Expanded(
              child: CarSeatsInputTile(
                controller: seatsCar,
                onChanged: (val) {
                  final parsed = int.tryParse(val);
                  if (parsed != null) car.seats = parsed;
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RadioSwitchTile(
                value: hasRadio,
                onChanged: (val) => setState(() {
                  hasRadio = val;
                  car.hasRadio = val;
                }),
              ),
            ),
            Expanded(
              child: SmokingSwitchTile(
                value: allowsSmoking,
                onChanged: (val) => setState(() {
                  allowsSmoking = val;
                  car.allowsSmoking = val;
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onPickImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (!context.mounted) return;

    if (pickedFile != null) {
      context.read<ProfileCubit>().pickImage(pickedFile, ProfileImagePicMode.car);

      setState(() {
        carImage = pickedFile.path;
        widget.carWithEdit?.image = pickedFile.path;
      });
    }
  }
}

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
    carName = TextEditingController(text: widget.carWithEdit?.type??"");
    colorCar = TextEditingController(text: widget.carWithEdit?.color??"");
    seatsCar = TextEditingController(text: widget.carWithEdit?.seats.toString()??"");
    hasRadio = widget.carWithEdit?.hasRadio??false;
    allowsSmoking = widget.carWithEdit?.allowsSmoking ??false;
    carImage = widget.carWithEdit?.image;
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
    return Column(
      children: [
        ProfileCarImagePicker(
          carImage: carImage,
          onPick: () => _onPickImage(context),
        ),
        CarNameInputTile(controller: carName, onSubmitted: (val) => widget.carWithEdit?.type = val),
        Row(
          children: [
            Expanded(child: CarColorInputTile(controller: colorCar, onSubmitted: (val) => widget.carWithEdit?.color = val)),
            Expanded(child: CarSeatsInputTile(controller: seatsCar, onSubmitted: (val) {
              final parsed = int.tryParse(val);
              if (parsed != null) widget.carWithEdit?.seats = parsed;
            })),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RadioSwitchTile(
                value: hasRadio,
                onChanged: (val) => setState(() {
                  hasRadio = val;
                  widget.carWithEdit?.hasRadio = val;
                }),
              ),
            ),
            Expanded(
              child: SmokingSwitchTile(
                value: allowsSmoking,
                onChanged: (val) => setState(() {
                  allowsSmoking = val;
                  widget.carWithEdit?.allowsSmoking = val;
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
    }
  }
}

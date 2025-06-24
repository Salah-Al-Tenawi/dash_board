import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/core/utils/widgets/cutom_list_tile.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/profiles/data/model/enum/image_mode.dart';
import 'package:sharecars/features/profiles/domain/entity/car_entity.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit.dart';

class ProfileCarINfoEdit extends StatefulWidget {
  final CarEntity ?carWithEdit;

  const ProfileCarINfoEdit({
    super.key,
    required this.carWithEdit,
  });

  @override
  State<ProfileCarINfoEdit> createState() => ProfileCarINfoEditState();
}

class ProfileCarINfoEditState extends State<ProfileCarINfoEdit> {
  late TextEditingController carName;
  late TextEditingController colorCar;
  late TextEditingController seatsCar;
  late bool hasRadio;
  late bool allowsSmoking;
  String? carImage;

  void _onPickImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (!context.mounted) return;

    if (pickedFile != null) {
      context.read<ProfileCubit>().pickImage(
            pickedFile,
            ProfileImagePicMode.car,
          );
    }
  }

  @override
  void initState() {
    super.initState();
    carName = TextEditingController(text: widget.carWithEdit?.type);
    colorCar = TextEditingController(text: widget.carWithEdit?.color);
    seatsCar = TextEditingController(text: widget.carWithEdit?.seats.toString());

    hasRadio = widget.carWithEdit!.hasRadio;
    allowsSmoking = widget.carWithEdit!.allowsSmoking;
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
        Align(
          alignment: Alignment.topLeft,
          child: MyButton(
            onPressed: () => _onPickImage(context),
            child: CircleAvatar(
              backgroundColor: MyColors.primary,
              maxRadius: 30,
              backgroundImage: carImage == null
                  ? const AssetImage(ImagesUrl.defualtCar)
                  : carImage!.startsWith('http')
                      ? NetworkImage(carImage!)
                      : FileImage(
                          File(carImage!),
                        ) as ImageProvider,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomListTile(
                title: "نوع السيارة",
                titleTextStyle: font15BoldRamadi,
                iconleading: const Icon(Icons.directions_car,
                    size: 20, color: MyColors.primary),
                subtitle: TextFormField(
                  controller: carName,
                  decoration: const InputDecoration(border: InputBorder.none),
                  onFieldSubmitted: (value) {
                    widget.carWithEdit?.type = value;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomListTile(
                title: "لون",
                titleTextStyle: font15BoldRamadi,
                iconleading: const Icon(Icons.color_lens,
                    size: 20, color: MyColors.primary),
                subtitle: TextFormField(
                  controller: colorCar,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Expanded(
              child: CustomListTile(
                title: "عدد الكراسي",
                titleTextStyle: font15BoldRamadi,
                iconleading:
                    const Icon(Icons.chair, size: 20, color: MyColors.primary),
                subtitle: TextFormField(
                  controller: seatsCar,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomListTile(
                title: "الراديو",
                titleTextStyle: font15BoldRamadi,
                iconleading:
                    const Icon(Icons.radio, size: 20, color: MyColors.primary),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 0.8, // تصغير الـ Switch
                      child: Switch(
                        value: hasRadio,
                        onChanged: (val) => setState(() => hasRadio = val),
                        activeColor: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        hasRadio ? "متاح" : "غير متاح",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12, // تصغير الخط
                          color: hasRadio ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomListTile(
                title: "التدخين",
                titleTextStyle: font15BoldRamadi,
                iconleading: const Icon(Icons.smoking_rooms,
                    size: 20, color: MyColors.primary),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: allowsSmoking,
                        onChanged: (val) => setState(() => allowsSmoking = val),
                        activeColor: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        allowsSmoking ? "مسموح" : "ممنوع",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: allowsSmoking ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

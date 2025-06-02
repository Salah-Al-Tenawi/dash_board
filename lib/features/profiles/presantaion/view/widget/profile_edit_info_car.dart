import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_app.dart';
import 'package:sharecars/core/utils/widgets/cutom_list_tile.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';

class ProfileEditINfoCar extends StatefulWidget {
  final String? image;
  final String name;
  final String color;
  final String seats;

  const ProfileEditINfoCar({
    super.key,
    required this.image,
    required this.name,
    required this.color,
    required this.seats,
  });

  @override
  State<ProfileEditINfoCar> createState() => _ProfileEditINfoCarState();
}

class _ProfileEditINfoCarState extends State<ProfileEditINfoCar> {
  late TextEditingController carName;
  late TextEditingController colorCar;
  late TextEditingController seatsCar;

  @override
  void initState() {
    super.initState();
    carName = TextEditingController(text: widget.name);
    colorCar = TextEditingController(text: widget.color);
    seatsCar = TextEditingController(text: widget.seats);
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
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: MyButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    // context.read<ProfileCubit>().pickImage(pickedFile);
                  }
                },
                child: CircleAvatar(
                  backgroundColor: MyColors.newrskey,
                  maxRadius: 30,
                  backgroundImage: widget.image == null
                      ? const AssetImage(ImagesUrl.defualtCar)
                      : NetworkImage(widget.image!) as ImageProvider,
                ),
              ),
            ),
            Expanded(
              child: CustomListTile(
                title: "نوع السيارة",
                titleTextStyle: font15BoldRamadi,
                iconleading: const Icon(
                  Icons.directions_car,
                  size: 20,
                  color: MyColors.newrskey,
                ),
                subtitle: TextFormField(
                  controller: carName,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
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
                iconleading: const Icon(
                  Icons.color_lens,
                  size: 20,
                  color: MyColors.newrskey,
                ),
                subtitle: TextFormField(
                  controller: colorCar,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomListTile(
                title: "عدد الكراسي",
                titleTextStyle: font15BoldRamadi,
                iconleading: const Icon(
                  Icons.chair,
                  size: 20,
                  color: MyColors.newrskey,
                ),
                subtitle: TextFormField(
                  controller: seatsCar,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
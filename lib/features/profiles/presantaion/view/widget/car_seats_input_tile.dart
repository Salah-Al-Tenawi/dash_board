import 'package:flutter/material.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/core/utils/widgets/cutom_list_tile.dart';

class CarSeatsInputTile extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  const CarSeatsInputTile({super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: "عدد الكراسي",
      titleTextStyle: font15BoldRamadi,
      iconleading: const Icon(Icons.chair, size: 20, color: MyColors.primary),
      subtitle: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(border: InputBorder.none),
        onFieldSubmitted: onSubmitted,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sharecars/core/utils/widgets/custom_text_form.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<MyTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("login"),
        MyButton(
          onPressed: () {},
          width: 100,
          height: 50,
          color: Colors.blueAccent,
          child: const Icon(Icons.grain_outlined),
        )
      ],
    );
  }
}

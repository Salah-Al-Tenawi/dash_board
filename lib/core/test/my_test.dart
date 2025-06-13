import 'package:flutter/material.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemBuilder: (context, counter) {
      Center(
        child: Container(
            color: Colors.red,
            width: 500,
            height: 500,
            child: Text("helllo $counter")),
      );
      return null;
    });
  }
}

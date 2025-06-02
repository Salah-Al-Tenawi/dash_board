  import 'package:flutter/material.dart';
import 'package:get/get.dart';

@override
  void openImage(String imageUrl) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child:imageUrl.startsWith("http")
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )
            : Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
        ),
      ),
    );
  }
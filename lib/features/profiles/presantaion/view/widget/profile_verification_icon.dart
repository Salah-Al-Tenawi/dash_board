import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharecars/core/them/my_colors.dart';

class ProfileVerificationIcon extends StatelessWidget {
  final String verification;

  const ProfileVerificationIcon({super.key, required this.verification});

  @override
  Widget build(BuildContext context) {
    switch (verification) {
      case "verified":
        return const Tooltip(
          message: "موثق",
          child: FaIcon(
            FontAwesomeIcons.circleCheck,
            color: MyColors.accent,
            size: 20,
          ),
        );
      case "pending":
        return const Tooltip(
          message: "قيد التوثيق",
          child: FaIcon(
            FontAwesomeIcons.clock,
            color: Colors.orange,
            size: 20,
          ),
        );
      case "none":
      default:
        return const Tooltip(
          message: "غير موثق",
          child: FaIcon(
            FontAwesomeIcons.circleExclamation,
            color: Colors.grey,
            size: 20,
          ),
        );
    }
  }
}

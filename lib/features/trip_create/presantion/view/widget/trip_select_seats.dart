// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/features/trip_create/data/model/trip_from.dart';

class TripSelectSeats extends StatelessWidget {
  final TripFrom tripFrom;
  const TripSelectSeats({
    super.key,
    required this.tripFrom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, bottom: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              tripFrom.numberSeats++;
            },
            icon: const FaIcon(
              FontAwesomeIcons.plus,
              size: 40,
              color: MyColors.primaryText,
            ),
          ),
          Text(
            "${tripFrom.numberSeats}",
            style: font20normalsky,
          ),
          IconButton(
            onPressed: () {
              if (tripFrom.numberSeats > 0) {
                tripFrom.numberSeats--;
              }
            },
            icon: const FaIcon(FontAwesomeIcons.minus,
                size: 40, color: MyColors.primaryText),
          ),
        ],
      ),
    );
  }
}

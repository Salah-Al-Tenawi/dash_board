import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:intl/intl.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_app.dart';
import 'package:sharecars/core/utils/widgets/date_picker.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/trip_create/data/model/trip_from.dart';
import 'package:sharecars/features/trip_create/presantion/view/widget/trip_date_show.dart';

class TripDateAndSeats extends StatefulWidget {
  const TripDateAndSeats({super.key});

  @override
  State<TripDateAndSeats> createState() => TripDateAndSeatsState();
}

class TripDateAndSeatsState extends State<TripDateAndSeats> {
  late final TripFrom? tripFrom;
  String? formattedDate;
  String? formattedTime;

  @override
  void initState() {
    super.initState();
    // tripFrom = Get.arguments;
    tripFrom = TripFrom();
  }

  Future<void> _selectDatetime(BuildContext context) async {
    DateTime? sel =
        await DatePickerService.showCustomDateTimePicker(context: context);
    if (sel != null) {
      final String fullDate = DateFormat('yyyy-MM-dd hh:mm a').format(sel);

      List<String> dateParts = fullDate.split(' ');
      formattedDate = dateParts[0];
      formattedTime = '${dateParts[1]} ${dateParts[2]}';
      tripFrom?.date = fullDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: true,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 100.w),
            child: Column(
              children: [
                const Text(
                  "حدد موعد الرحلة",
                  style: font15BoldRamadi,
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  onPressed: () async {
                    await _selectDatetime(context);
                  },
                  width: 100.w,
                  height: 30.h,
                  child: const FaIcon(FontAwesomeIcons.calendarDays,
                      size: 60, color: MyColors.newrskey),
                ),
                formattedDate != null && formattedTime != null
                    ? TripDateShow(day: formattedDate!, hour: formattedTime!)
                    : const SizedBox(),
                const Divider(
                  color: MyColors.newramadi,
                  endIndent: 50,
                  indent: 50,
                  thickness: 0.3,
                ),
                const Text(
                  "حدد عدد الكراسي المتاحة",
                  style: font15BoldRamadi,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        tripFrom!.numberSeats++;
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.plus,
                        size: 40,
                        color: MyColors.newramadi,
                      ),
                    ),
                    Text(
                      "${tripFrom?.numberSeats ?? 0}",
                      style: font20normalsky,
                    ),
                    IconButton(
                      onPressed: () {
                        if (tripFrom!.numberSeats > 0) {
                          tripFrom!.numberSeats--;
                        }
                      },
                      icon: const FaIcon(FontAwesomeIcons.minus,
                          size: 40, color: MyColors.newramadi),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sharecars/core/them/text_style_app.dart';

class ProfileRating extends StatelessWidget {
  final int totalRating;
  final int averageRating;
  final int tripsCount;
  const ProfileRating(
      {super.key,
      required this.averageRating,
      required this.totalRating,
      required this.tripsCount});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RatingBarIndicator(
        rating: averageRating.toDouble(),
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: 5,
        itemSize: 20.0,
        direction: Axis.horizontal,
      ),
      const SizedBox(height: 2),
      Text(
        "($totalRating) التقييمات",
        style: font10NormalGrey,
      ),
      Text(
        "($tripsCount) الرحلات",
        style: font10NormalGrey,
      ),
    ]);
  }
}

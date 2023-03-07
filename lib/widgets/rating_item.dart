import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;
  const RatingItem(this.index, this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/Icon_star_solid.png'
          : 'assets/Icon_star_solid_grey.png',
      width: 20,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';

class FeaturedTestSeriesCard extends StatelessWidget {
  const FeaturedTestSeriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(child: ClipRRect(child: Container(
        width: 80,
        height: 100,
        color: Colors.grey))),

      spacerHeight(5),
      Text("data")]);
  }
}

import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/domain/models/api_response.dart';
import 'package:kas_mentor_mt/presentation/widgets/image_loader.dart';

import '../../domain/config/theme/colors.dart';

class CatCard extends StatelessWidget {
  const CatCard(this.highlight, {super.key});

  final Highlight highlight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.blue, Colors.purple]),
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: AspectRatio(aspectRatio: 1 / 1, child: ImageLoader(url: highlight.statusImage)),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          highlight.statusName.length > 10
              ? '${highlight.statusName.substring(0, 10)}..'
              : highlight.statusName,
          style: TextStyle(fontSize: 14, color: ColorConst.textBlack),
        )      ],
    );
  }
}

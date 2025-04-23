import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/presentation/widgets/image_loader.dart';

import '../../domain/config/theme/colors.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key});

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
              child: AspectRatio(aspectRatio: 1 / 1, child: ImageLoader(url: "https://picsum.photos/200")),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text('Tips', style: TextStyle(fontSize: 14, color: ColorConst.textBlack)),
      ],
    );
  }
}

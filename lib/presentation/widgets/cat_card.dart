import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/presentation/widgets/image_loader.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
            child: AspectRatio(
              aspectRatio: 1/1,
              child: ImageLoader(
                url: "https://picsum.photos/200",
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Tips',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF4A5568),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

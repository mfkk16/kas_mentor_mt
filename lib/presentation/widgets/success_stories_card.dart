import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';

import 'image_loader.dart';

class SuccessStoriesCard extends StatelessWidget {
  const SuccessStoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ImageLoader(url: "https://dev.kasmentor.org/files/6161.jpg", radius: 100, size: 50),
                  spacerWidth(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Rahul Kumar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text("IIT Delhi - 2025", style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                "The structured approach and mock tests helped me crack JEE Advanced with AIR 235.",
                maxLines: 3,
                style: TextStyle(fontSize: 14, height: 1.4, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

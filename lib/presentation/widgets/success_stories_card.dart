import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/domain/models/ApiResponse.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';

import 'image_loader.dart';

class SuccessStoriesCard extends StatelessWidget {
  const SuccessStoriesCard(this.successStori, {super.key});

  final SuccessStory successStori;

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
                  ImageLoader(url: "https://dev.kasmentor.org${successStori.studentImage}", radius: 100, size: 50),
                  spacerWidth(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(successStori.studentName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text(successStori.product, style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                successStori.testimonialMessage,
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

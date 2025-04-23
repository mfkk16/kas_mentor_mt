import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/domain/models/ApiResponse.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';

import 'image_loader.dart';

class FeaturedCoursesCard extends StatelessWidget {
  const FeaturedCoursesCard(this.featuredCours, {super.key});

  final FeaturedCourse featuredCours;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ImageLoader(url: featuredCours.courseImage, radius: 0),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.2)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerHeight(3),
                    Text(
                      featuredCours.courseName,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    spacerHeight(5),
                    const Text(
                      'Kerala PSC',
                      maxLines: 1,
                      style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 14, color: Color(0xFF666666)),
                    ),
                    spacerHeight(5),
                    Text(
                      "₹${featuredCours.courseFee}",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0066CC),
                      ),
                    ),
                    spacerHeight(3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

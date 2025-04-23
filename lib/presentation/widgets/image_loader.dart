import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/constants/assets.dart';

class ImageLoader extends StatelessWidget {
  final double size;
  final double radius;
  final String url;
  final BoxFit fit;

  const ImageLoader({super.key, this.size = double.infinity, required this.url, this.radius = 100, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: size,
        height: size,
        child: CachedNetworkImage(
          height: size,
          width: size,
          fit: fit,
          imageUrl: url,
          placeholder: (context, url) => Image.asset(Assets.logo, fit: fit, height: size, width: size),
          errorWidget: (context, url, error) => Image.asset(Assets.logo, fit: fit, height: size, width: size),
        ),
      ),
    );
  }
}
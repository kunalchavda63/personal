import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../models/models.dart';

class CustomImageView extends StatelessWidget {
  final String path;
  final ImageType sourceType;
  final double? height;
  final double? width;
  final BoxFit fit;

  const CustomImageView({
    Key? key,
    required this.path,
    required this.sourceType,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (sourceType) {
      case ImageType.asset:
        return Image.asset(path, height: height, width: width, fit: fit);
      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: path,
          height: height,
          width: width,
          fit: fit,
          placeholder:
              (context, url) =>
                  const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      case ImageType.file:
        return Image.file(File(path), height: height, width: width, fit: fit);
    }
  }
}

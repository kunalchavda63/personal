import 'package:flutter/material.dart';

class CustomMaterialIcon extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Color? color;
  final double? fill;
  final BlendMode? blendMode;
  final String? semanticLabel;
  final double? opticalSize;
  final List<Shadow>? shadows;

  const CustomMaterialIcon({
    super.key,
    this.icon,
    this.size,
    this.color,
    this.fill,
    this.blendMode,
    this.semanticLabel,
    this.opticalSize,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
      blendMode: blendMode,
      semanticLabel: semanticLabel,
      opticalSize: opticalSize,
      shadows: shadows,
    );
  }
}

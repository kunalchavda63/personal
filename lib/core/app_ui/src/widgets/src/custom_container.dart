import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? h;
  final double? w;
  final Widget? child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Border? border;
  final VoidCallback? onTap;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final Alignment? alignment;
  final BoxShape? boxShape;
  final BlendMode? blendMode;
  final Clip? clipBehaviour;

  const CustomContainer({
    super.key,
    this.h,
    this.w,
    this.child,
    this.padding,
    this.borderRadius,
    this.border,
    this.onTap,
    this.color,
    this.boxShadow,
    this.alignment,
    this.boxShape,
    this.blendMode,
    this.clipBehaviour,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        alignment: alignment,
        padding: padding,
        decoration: BoxDecoration(
          backgroundBlendMode: blendMode,
          border: border,
          borderRadius: borderRadius,
          color: color,
          boxShadow: boxShadow,
          shape: boxShape ?? BoxShape.rectangle,
        ),
        child: child,
        clipBehavior: clipBehaviour ?? Clip.none,
      ),
    );
  }
}

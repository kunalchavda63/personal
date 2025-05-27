import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final String? semanticsIdentifier;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final TextDirection? textDirection;

  const CustomText({
    super.key,
    required this.data,
    this.style,
    required this.overflow,
    this.strutStyle,
    this.textAlign,
    this.textDecoration,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      overflow: overflow,
      strutStyle: strutStyle,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaler: textScaler,
      textHeightBehavior: textHeightBehavior,
      textWidthBasis: textWidthBasis,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
    );
  }
}

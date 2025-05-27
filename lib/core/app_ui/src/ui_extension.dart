import 'package:flutter/material.dart';

import '../../models/enum.dart';

extension FontFamilyExtension on FontFamily {
  String get name {
    switch (this) {
      case FontFamily.avenir:
        return 'Avenir'; // Matches pubspec.yaml
    }
  }
}

// Extension on TextStyle for shorthand styling
extension CustomTextStyle on TextStyle {
  TextStyle family(FontFamily family) => copyWith(fontFamily: family.name);
  TextStyle s(double size) => copyWith(fontSize: size);
  TextStyle w(int weight) =>
      copyWith(fontWeight: FontWeight.values[(weight ~/ 100) - 1]);
  TextStyle c(Color color) => copyWith(color: color);
  TextStyle letter(double size) => copyWith(letterSpacing: size);
  TextStyle line(double height) => copyWith(height: height);
  TextStyle style(FontStyle s) => copyWith(fontStyle: s);
}

extension CustomPadding on Widget {
  Padding padLeft(double left) =>
      Padding(padding: EdgeInsets.only(left: left), child: this);

  Padding padRight(double right) =>
      Padding(padding: EdgeInsets.only(right: right), child: this);

  Padding padTop(double top) =>
      Padding(padding: EdgeInsets.only(top: top), child: this);

  Padding padBottom(double bottom) =>
      Padding(padding: EdgeInsets.only(bottom: bottom), child: this);

  Padding padSymmetric({double? horizontal = 0.0, double? vertical = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal!,
          vertical: vertical!,
        ),
        child: this,
      );
  Padding padH(double horizontal) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal),
    child: this,
  );

  Padding padV(double vertical) =>
      Padding(padding: EdgeInsets.symmetric(vertical: vertical), child: this);

  Padding padAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
}

extension CustomColors on ThemeData {
  Color get spotifyGreen => const Color(0XFF1DB954);
}

extension CustomBottomSheetExtension on BuildContext {
  Future<void> showCustomBottomSheet({Color? bgColor, Widget? child}) {
    return showModalBottomSheet(
      context: this,
      backgroundColor: bgColor,
      builder: (_) => child ?? const SizedBox(),
    );
  }
}

// use that custom color Theme.of(context).spotifyGreen;

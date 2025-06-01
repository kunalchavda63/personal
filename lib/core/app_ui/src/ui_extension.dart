import 'package:personal/core/app_ui/app_ui.dart';

import '../../models/src/pop_up_model.dart';

// Extension on FontFamily for shorthand styling
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

// Extesnion on Padding for shorthand padding
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

// Extension on ThemeData for shrthand themes
extension CustomColors on ThemeData {
  Color get spotifyGreen => AppColors.hex1ed7;
}

// Extension on CustomBottomSheet for shorthand dialogs
extension CustomBottomSheetExtension on BuildContext {
  Future<void> showCustomBottomSheet({Color? bgColor, Widget? child}) {
    return showModalBottomSheet(
      context: this,
      backgroundColor: bgColor,
      builder: (_) => child ?? const SizedBox(),
    );
  }

  Future<String?> showCustomPopupMenu({
    required BuildContext context,
    required GlobalKey anchorKey,
    required List<PopUpModel> items,
    Widget Function(PopUpModel)? itemBuilder,
    double itemHeight = 48, // Default estimated item height
    Color? color,
  }) async {
    final RenderBox renderBox =
        anchorKey.currentContext!.findRenderObject() as RenderBox;
    final Size widgetSize = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate actual menu height based on item count
    final double menuHeight = items.length * itemHeight;

    final bool showBelow =
        (offset.dy + widgetSize.height + menuHeight) < screenHeight;

    final RelativeRect position =
        showBelow
            ? RelativeRect.fromLTRB(
              offset.dx,
              offset.dy + widgetSize.height,
              offset.dx + widgetSize.width,
              offset.dy,
            )
            : RelativeRect.fromLTRB(
              offset.dx,
              offset.dy - menuHeight,
              offset.dx + widgetSize.width,
              offset.dy,
            );

    return await showMenu<String>(
      context: context,
      position: position,
      color: color,
      items:
          items.map((item) {
            return PopupMenuItem<String>(
              value: item.id,
              child: itemBuilder != null ? itemBuilder(item) : Text(item.data),
            );
          }).toList(),
    );
  }
}

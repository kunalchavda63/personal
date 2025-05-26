import 'package:flutter/material.dart';
import 'package:personal/core/app_ui/src/widgets/src/buttons/buttons.dart';
import 'package:personal/core/app_ui/src/widgets/src/buttons/src/custom_white_border_button.dart';
import 'package:personal/core/app_ui/src/widgets/src/custom_appbar.dart';
import 'package:personal/core/app_ui/src/widgets/src/custom_bottom_nav.dart';
import 'package:personal/core/app_ui/src/widgets/src/custom_container.dart';
import 'package:personal/core/app_ui/src/widgets/src/custom_floating_button.dart';
import 'package:personal/core/app_ui/src/widgets/src/custom_imageview.dart';
import 'package:personal/core/app_ui/src/widgets/src/custom_text.dart';
import 'package:personal/core/app_ui/src/widgets/src/custom_text_field.dart';
import 'package:personal/core/models/src/bottom_nav_model.dart';
import '../../../models/models.dart';

class CustomWidgets {
  // Custom Text field
  static Widget customTextField({
    String? label,
    String? hintText,
    String? Function(String?)? validator,
    InputBorder? border,
    TextEditingController? controller,
    Widget? suffixIcon,
    Widget? prefixIcon,
    EdgeInsets? padding,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
    TextCapitalization? textCapitalization,
    bool? isExpand,
    Color? fillColor,
    bool? filled,
    TextStyle? style,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
  }) {
    return CustomTextField(
      label: label,
      hintText: hintText,
      hintStyle: hintStyle,
      labelStyle: labelStyle,
      validator: validator,
      border: border,
      controller: controller,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      padding: padding,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      textInputType: textInputType,
      isExpand: isExpand,
      fillColor: fillColor,
      filled: filled,
      style: style,
    );
  }

  // Custom Container
  static Widget customContainer({
    double? h,
    double? w,
    Widget? child,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Border? border,
    BoxShape? boxShape,
    VoidCallback? onTap,
    Color? color,
    List<BoxShadow>? boxShadow,
    Alignment? alignment,
    BlendMode? blendMode,
  }) {
    return CustomContainer(
      h: h,
      w: w,
      color: color,
      child: child,
      padding: padding,
      border: border,
      borderRadius: borderRadius,
      onTap: onTap,
      boxShadow: boxShadow,
      alignment: alignment,
      boxShape: boxShape,
      blendMode: blendMode,
    );
  }

  // Custom Back Button
  static Widget customCircleBackButton() {
    return CustomCircleBackButton();
  }

  // Custom Image View
  static Widget customImageView({
    String? path,
    ImageType? sourceType,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return CustomImageView(
      path: path ?? '',
      sourceType: sourceType ?? ImageType.asset,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
    );
  }

  // Custom Green Button
  static Widget customGreenButton({
    String? text,
    VoidCallback? onTap,
    TextStyle? style,
  }) {
    return CustomGreenButton(text: text, onTap: onTap, style: style);
  }

  // Custom White border button
  static Widget customWhiteBorderButton({
    required String buttonTitle,
    VoidCallback? onTap,
    required String path,
    TextStyle? style,
  }) {
    return CustomWhiteBorderButton(
      buttonTitle: buttonTitle,
      onTap: onTap,
      path: path,
      style: style,
    );
  }

  // Custom Appbar
  static PreferredSizeWidget customAppBar({
    Widget? leading,
    Widget? title,
    Color? bgColor,
    bool? isCenterTitle,
    double? bottomOpacity,
    double? elevation,
    double? scrollUnderElevation,
    bool? autoImplyLeading,
  }) {
    return CustomAppbar(
      leading: leading,
      title: title,
      bgColor: bgColor,
      isCenterTitle: isCenterTitle ?? true,
      bottomOpacity: bottomOpacity ?? 1.0,
      elevation: elevation ?? 0,
      scrollUnderElevation: scrollUnderElevation ?? 0,
      autoImplyLeading: autoImplyLeading ?? true,
    );
  }

  // Custom text widget
  static Widget customText({
    String data = '',
    TextStyle? style,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    Locale? locale,
    bool? softWrap,
    double? textScaleFactor,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
    String? semanticsIdentifier,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
    TextDirection? textDirection,
  }) {
    return CustomText(
      data: data,
      style: style,
      overflow: overflow,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDecoration: textDecoration,
      locale: locale,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      semanticsIdentifier: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
      textDirection: textDirection,
    );
  }

  // Custom Floating Action Button
  static Widget customFloatingActionButton({
    String? label,
    VoidCallback? onTap,
    Color? backgroundColor,
    String? toolTip,
    Widget? child,
    FabType fabType = FabType.normal, // ✅ Set default
  }) {
    return CustomFloatingButton(
      label: label,
      onTap: onTap,
      backgroundColor: backgroundColor,
      toolTip: toolTip,
      child: child,
      type: fabType, // ✅ This was missing
    );
  }

  //Custom Bottom Navigation Bar
  static Widget customBottomNavigationBar({
    List<BottomNavModel>? bottomNavList,
    int? currentIndex,
    ValueChanged<int>? onTap,
  }) {
    return CustomBottomNav(
      bottomNavList: bottomNavList ?? [],
      currentIndex: currentIndex ?? 0,
      onTap: onTap,
    );
  }
}

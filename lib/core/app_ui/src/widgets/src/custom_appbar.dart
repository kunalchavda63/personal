import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final Color? bgColor;
  final bool isCenterTitle;
  final double bottomOpacity;
  final double elevation;
  final double scrollUnderElevation;
  final bool autoImplyLeading;

  const CustomAppbar({
    super.key,
    this.leading,
    this.title,
    this.bgColor,
    this.isCenterTitle = true,
    this.bottomOpacity = 1.0,
    this.elevation = 0,
    this.scrollUnderElevation = 0,
    this.autoImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      bottomOpacity: bottomOpacity,
      elevation: elevation,
      scrolledUnderElevation: scrollUnderElevation,
      centerTitle: isCenterTitle,
      leading: leading,
      title: title,
      automaticallyImplyLeading: autoImplyLeading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

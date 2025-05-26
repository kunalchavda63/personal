import 'package:flutter/material.dart';
import 'package:personal/core/app_ui/app_ui.dart';

class CustomGreenButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final TextStyle? style;
  const CustomGreenButton({super.key, this.text, this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return CustomWidgets.customContainer(
      onTap: onTap,
      h: 49,
      w: size,
      color: AppColors.hex1ed7,
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(45),

      child: Text(text ?? '', style: style ?? BaseStyle.s16w900),
    );
  }
}

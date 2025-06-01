import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal/core/app_ui/app_ui.dart';

class CustomWhiteBorderButton extends StatelessWidget {
  final String? buttonTitle;
  final VoidCallback? onTap;
  final String? path;
  final TextStyle? style;

  const CustomWhiteBorderButton({
    super.key,
    this.buttonTitle,
    this.onTap,
    this.path,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return CustomWidgets.customContainer(
      onTap: onTap,
      h: 49,
      w: size,
      border: Border.all(color: AppColors.white),
      borderRadius: BorderRadius.circular(45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(path ?? AssetIcons.icGoogle),
          CustomWidgets.customText(
            data: buttonTitle ?? '',
            style: style ?? BaseStyle.s23w900.c(AppColors.hex1ed7),
          ),
          SizedBox(),
        ],
      ).padH(16),
    );
  }
}

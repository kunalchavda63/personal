import 'package:flutter/cupertino.dart';
import 'package:personal/core/app_ui/app_ui.dart';
import 'package:personal/core/utilities/src/helper_method.dart';

class CustomCanCopy extends StatelessWidget {
  final String? text;

  const CustomCanCopy({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return CustomWidgets.customContainer(
      color: AppColors.hex1212.withAlpha(200),
      borderRadius: BorderRadius.circular(20),
      h: 40,
      w: MediaQuery.of(context).size.width,
      onTap: () {
        copyToClipboard(text ?? '');
      },
      border: Border.all(color: AppColors.hexF5f5),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: CustomWidgets.customText(
        data: text ?? '',
        textAlign: TextAlign.center,
        style: BaseStyle.s10w700.c(AppColors.hex1ed7),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

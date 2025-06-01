import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal/core/app_ui/app_ui.dart';

class CustomCircleBackButton extends StatelessWidget {
  const CustomCircleBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWidgets.customContainer(
      h: 32,
      w: 32,
      onTap: () {
        context.pop();
      },
      padding: EdgeInsets.all(8),
      color: AppColors.hex0303,
      boxShape: BoxShape.circle,
      child: SvgPicture.asset(AssetIcons.icCutLeft, height: 16, width: 16),
    );
  }
}

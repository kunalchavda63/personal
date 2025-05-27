import 'package:personal/core/app_ui/app_ui.dart';

class CustomPlaylistCard extends StatelessWidget {
  const CustomPlaylistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWidgets.customContainer(
      h: 280,
      w: 150,
      borderRadius: BorderRadius.circular(8),
      color: AppColors.hex1212,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomWidgets.customImageView(
            height: 200,
            fit: BoxFit.cover,
            sourceType: ImageType.network,
            path:
                'https://img.freepik.com/free-photo/earth-with-headphones-with-glittery-effect-black-background_1048-2890.jpg?ga=GA1.1.709110294.1727162328&semt=ais_items_boosted&w=740',
          ),
          CustomWidgets.customText(
            data: 'Ranjan (From Do PAtticxvsv)',
            style: BaseStyle.s15w700.c(AppColors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).padBottom(10),
          CustomWidgets.customText(
            data: 'Sachet Pararamparadfmklm mdskfmm cmkmk mmk dsgsg sgm',
            style: BaseStyle.s11w700.c(AppColors.hex7777),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

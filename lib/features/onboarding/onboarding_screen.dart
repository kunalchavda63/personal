import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:personal/core/app_ui/app_ui.dart';
import 'package:personal/core/services/navigation/router.dart';
import 'package:personal/core/utilities/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    const imageData =
        'https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

    return Scaffold(
      backgroundColor: AppColors.hex1212,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CustomWidgets.customImageView(
                  path: imageData,
                  sourceType: ImageType.network,
                  height: 350,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CustomWidgets.customContainer(
                    h: 350,
                    w: size.width,
                    color: AppColors.transparent,
                    blendMode: BlendMode.lighten,
                  ),
                ),
                Positioned(
                  bottom: -24,
                  left: 0,
                  right: 0,
                  child: CustomWidgets.customContainer(
                    h: 53,
                    w: 53,
                    child: SvgPicture.asset(
                      AssetIcons.icAppBgWhite,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            CustomWidgets.customText(
              data: AppStrings.millionsOfSong,
              style: BaseStyle.s28w900.c(AppColors.white),
            ).padTop(34),
            CustomWidgets.customText(
              data: AppStrings.freeOnSpotify,
              style: BaseStyle.s28w900.c(AppColors.white),
            ).padBottom(22),
            CustomWidgets.customGreenButton(
              onTap: () {
                push(context, RoutesEnum.artists.path);
              },
              text: AppStrings.signUpFree,
            ).padH(30).padBottom(12),
            CustomWidgets.customWhiteBorderButton(
              onTap: () {
                push(context, RoutesEnum.panelDemo.path);
              },
              buttonTitle: "${AppStrings.continueWith} ${AppStrings.google}",
              style: BaseStyle.s16w900.c(AppColors.hexF5f5).c(AppColors.white),
              path: AssetIcons.icGoogle,
            ).padH(30).padBottom(12),

            CustomWidgets.customWhiteBorderButton(
              buttonTitle: "${AppStrings.continueWith} ${AppStrings.facebook}",
              style: BaseStyle.s16w900.c(AppColors.hexF5f5).c(AppColors.white),
              path: AssetIcons.icFacebook,
            ).padH(30).padBottom(12),

            CustomWidgets.customWhiteBorderButton(
              buttonTitle: "${AppStrings.continueWith} ${AppStrings.apple}",
              style: BaseStyle.s16w900.c(AppColors.hexF5f5).c(AppColors.white),
              path: AssetIcons.icApple,
            ).padH(30).padBottom(14),

            GestureDetector(
              onTap: () async {
                try {
                  log('Tapped');

                  if (isAndroid || isIos) {
                    push(context, RoutesEnum.androidScreen.path);
                  } else {
                    push(context, RoutesEnum.windowScreen.path);
                  }
                  Position position = await determinePosition();
                  List<Placemark> placeMark = await getListPlace(position);
                  print(placeMark.toString());
                  log(
                    'Latitude: ${position.latitude}, Longitude: ${position.longitude}',
                  );
                } catch (e) {
                  log('Error getting location: $e');
                }
              },

              child: CustomWidgets.customText(
                data: AppStrings.logIn,
                style: BaseStyle.s16w900.c(AppColors.hexF5f5),
              ).padBottom(MediaQuery.of(context).viewPadding.bottom + 54),
            ),
          ],
        ),
      ),
    );
  }
}

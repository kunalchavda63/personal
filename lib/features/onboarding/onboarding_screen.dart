import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:personal/core/app_ui/app_ui.dart';
import 'package:personal/core/models/models.dart';
import 'package:personal/core/services/navigation/src/route_constants.dart';
import 'package:personal/core/utilities/src/strings.dart';
import '../../core/utilities/src/helper/helper_method.dart';

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
                  path:
                      'https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
            Text(
              AppStrings.freeOnSpotify,
              style: BaseStyle.s28w900.c(AppColors.white),
            ).padBottom(22),
            CustomWidgets.customGreenButton(
              onTap: () {
                context.push(RoutesEnum.homeScreen.path);
              },
              text: AppStrings.signUpFree,
            ).padH(30).padBottom(12),
            CustomWidgets.customWhiteBorderButton(
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

                  Position position = await determinePosition();

                  log(
                    'Latitude: ${position.latitude}, Longitude: ${position.longitude}',
                  );

                  List<Placemark> placemarks = await placemarkFromCoordinates(
                    position.latitude,
                    position.longitude,
                  );

                  if (placemarks.isNotEmpty) {
                    final place = placemarks.first;
                    log('Place name: ${place.name}');
                    log(
                      'Full address: ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}',
                    );
                  } else {
                    log('No placemarks found.');
                  }
                } catch (e) {
                  log('Error getting location: $e');
                }
              },

              child: Text(
                AppStrings.logIn,
                style: BaseStyle.s16w900.c(AppColors.hexF5f5),
              ).padBottom(MediaQuery.of(context).viewPadding.bottom + 54),
            ),
          ],
        ),
      ),
    );
  }
}

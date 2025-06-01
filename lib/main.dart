import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal/core/services/navigation/src/app_router.dart';
import 'package:personal/core/services/network/base/app_dio_manager.dart';
import 'package:window_size/window_size.dart';

import 'core/utilities/src/extensions/extensions.dart';
import 'core/utilities/src/extensions/logger/logger.dart';
import 'core/utilities/src/helper_method.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  takeLocationPermission();

  if (isWindows || isMacOs || isLinux) {
    logger.i('Running on Desktop');
    final info = await getWindowInfo();
    final screenFrame = info.screen?.visibleFrame;

    if (screenFrame != null) {
      setWindowTitle('My Flutter App');
      final screenSize = Size(screenFrame.width, screenFrame.height);
      setWindowMinSize(const Size(450, 812));
      setWindowMaxSize(screenSize);
    } else {
      setWindowMinSize(const Size(450, 812));
      setWindowMaxSize(const Size(1920, 1080));
    }
  }

  try {
    final response = await fetchLocalDataList();
    if (response.success && response.data != null) {
      logger.d("✅ Local Data List Fetched:");
      for (var item in response.data!) {
        logger.d(item);
      }
    } else {
      logger.e("❌ Failed to fetch local data: ${response.message}");
    }
  } catch (e) {
    logger.e("❗ Exception occurred while fetching data: $e");
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouterConfig,
          debugShowCheckedModeBanner: false,
        );
      },
      child: SizedBox(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal/core/services/navigation/src/app_router.dart';
import 'package:window_size/window_size.dart';

import 'core/utilities/src/extensions/extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isWindows || isMacOs || isLinux) {
    // Get the screen size
    final info = await getWindowInfo();
    final screenFrame = info.screen?.visibleFrame;

    if (screenFrame != null) {
      setWindowTitle('My Flutter App');
      final screenSize = Size(screenFrame.width, screenFrame.height);

      setWindowMinSize(const Size(450, 812));
      setWindowMaxSize(screenSize); // Set max size to screen size
    } else {
      // Fallback if screen info not available
      setWindowMinSize(const Size(450, 812));
      setWindowMaxSize(const Size(1920, 1080));
    }
  }

  runApp(ProviderScope(child: const MyApp()));
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

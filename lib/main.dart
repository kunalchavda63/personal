import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal/core/services/navigation/src/app_router.dart';

import 'core/utilities/src/helper_method.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  takeLocationPermission();

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

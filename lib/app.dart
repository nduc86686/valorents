import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/constants/app_colors.dart';
import 'package:valo/screen2/main2.dart';
import 'package:valo/screens/custom_error_screen.dart';
import 'package:valo/screens/error_screen.dart';

import 'app_router.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return kDebugMode
              ? CustomErrorScreen(errorDetails: errorDetails)
              : ErrorScreen(
                  errorDetails: errorDetails,
                  isNetworkError: false,
                );
        };
        return widget!;
      },
      child: MaterialApp(
        title: Platform.isAndroid ? 'Guide for Valo' : 'Handbook for Valorant',
        debugShowCheckedModeBanner: false,

        initialRoute: Routes.home,
        onGenerateRoute: AppRouter.routesGenerator,
        theme: AppTheme().valoTheme,
      ),
    );
  }
}

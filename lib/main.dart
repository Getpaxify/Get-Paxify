import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:paxify/modules/splash_view/splash_view.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, 
      statusBarIconBrightness: Brightness.dark, 
      systemNavigationBarIconBrightness: Brightness.dark,  
    ),
  );

   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Paxify',
            theme: ThemeData(
              scaffoldBackgroundColor: whiteColor,
              appBarTheme: AppBarTheme(
                backgroundColor: whiteColor
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            fallbackLocale: const Locale('en', 'US'),
            initialRoute: Routes.SPLASHSCREEN,
            getPages: AppPages.pages,
          );
        });
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_project/core/Constant/Theme/Them_Service.dart';
import 'package:my_project/routes.dart';
import 'InitialBindings.dart';
import 'Model/My Services/My_Services_Model.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  final myServices = await MyServices().init();
  Get.put(myServices);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeService = ThemeService();
    return GetMaterialApp(
      theme: themeService.lightTheme,
      darkTheme: themeService.darkTheme,
      themeMode: themeService.getThemeMode(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      getPages: routes,
      // home: const OnBoardingView()//BottomNativactionBarView(),
    );
  }
}

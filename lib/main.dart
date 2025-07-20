import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandwichy/core/router/router_generation_config.dart';
import 'package:sandwichy/feature/on_boarding/on_boarding_services.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
  await OnBoardingServices.initializeSharedPreferencesStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child){
          return MaterialApp.router(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            routerConfig: RouterGenerationConfig.goRouter,
            debugShowCheckedModeBanner: false,
          );
        },

    );
  }
}



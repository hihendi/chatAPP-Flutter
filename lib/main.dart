import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/error_screen.dart';
import 'app/utils/loading_screen.dart';
import 'app/utils/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          // return GetMaterialApp(
          //   debugShowCheckedModeBanner: false,
          //   title: "Chat App",
          //   initialRoute: Routes.CHAT_ROOM,
          //   getPages: AppPages.routes,
          // );

          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Chat App",
              initialRoute:
                  authController.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
              getPages: AppPages.routes,
            ),
          );

          // return FutureBuilder(
          //   future: Future.delayed(Duration(seconds: 4)),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       return Obx(
          //         () => GetMaterialApp(
          //           debugShowCheckedModeBanner: false,
          //           title: "Chat App",
          //           initialRoute: authController.isSkipIntro.isTrue
          //               ? authController.isAuth.isTrue
          //                   ? Routes.HOME
          //                   : Routes.LOGIN
          //               : Routes.INTRODUCTION,
          //           getPages: AppPages.routes,
          //         ),
          //       );
          //     }

          //     return SplashScreen();
          //   },
          // );
        }

        return LoadingScreen();
      },
    );
  }
}
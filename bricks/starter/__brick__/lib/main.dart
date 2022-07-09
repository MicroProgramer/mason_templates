import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:{{projectName}}/helpers/helpers.dart';
import 'package:{{projectName}}/views/screens/screen_login.dart';
import 'package:{{projectName}}/widgets/custom_error.dart';
/*Created Project "{{projectName}}" by MicroProgramers - https://microprogramers.org*/


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 2));
  colorConfig();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

void colorConfig() {
  appPrimaryColor = MaterialColor(
    0xFF2F97D1,
    const <int, Color>{
      50: const Color(0xFF2F97D1),
      100: const Color(0xFF2F97D1),
      200: const Color(0xFF2F97D1),
      300: const Color(0xFF2F97D1),
      400: const Color(0xFF2F97D1),
      500: const Color(0xFF2F97D1),
      600: const Color(0xFF2F97D1),
      700: const Color(0xFF2F97D1),
      800: const Color(0xFF2F97D1),
      900: const Color(0xFF2F97D1),
    },
  );
  appBoxShadow = [BoxShadow(blurRadius: 18, color: Color(0x414D5678))];
  buttonColor = const Color(0xFFED1C24);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return GetMaterialApp(
          home: ScreenLogin(),
          locale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          title: "{{appname}}",
          theme: ThemeData(
            fontFamily: 'SegeoUi',
            primarySwatch: appPrimaryColor,
            checkboxTheme: CheckboxThemeData(
              checkColor: MaterialStateProperty.all(Colors.white),
              fillColor: MaterialStateProperty.all(appPrimaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: BorderSide(color: Color(0xff585858), width: 1),
            ),
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              titleTextStyle: normal_h1Style_bold.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "SegeoUi"),
              centerTitle: false,
              systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            dividerColor: Colors.transparent,
            scaffoldBackgroundColor: Color(0xFFFAFBFF),
            backgroundColor: Color(0xFFFAFBFF),
          ),
          builder: (context, widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return CustomError(errorDetails: errorDetails);
            };
            return ScrollConfiguration(behavior: NoColorScrollBehavior(), child: widget!);
            // return widget!;
            // return ScrollConfiguration(behavior: ScrollBehaviorModified(), child: widget!);
          },
        );
      },
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//
//   print("Handling a background message: ${message}");
// }

class NoColorScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

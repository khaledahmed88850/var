import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/get_it_services.dart';
import 'package:flutter_application_1/features/home/presentation/view/home_view.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),

      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'),
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Cairo'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: HomeView.routeName,
      ),
    );
  }
}

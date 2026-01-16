import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_showcase/home_page.dart';
import 'package:google_maps_showcase/core/routes/routes.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_maps_showcase/core/firebase_services/firebase_services.dart';
import 'package:google_maps_showcase/core/injection_container/injection_container.dart'
    as dependency_injection_container;
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dependency_injection_container.init();
  FirebaseServices.initializeFCM();
  FlutterError.onError = (errorDetails) {
    // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    //FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.1)),
          child: ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      },
      onGenerateRoute: AppRouter.generateRoute,
      home: const HomePage(title: 'Flutter Maps'),
    );
  }
}

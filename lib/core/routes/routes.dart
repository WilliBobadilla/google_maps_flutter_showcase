import 'package:flutter/material.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/pages/maps_example_one_page.dart';

import 'package:responsive_framework/responsive_framework.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MapsExampleOnePage.route:
        return _fadePageRouteBuilder(
          child: MapsExampleOnePage(),
          name: MapsExampleOnePage.route,
        );
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }

  static PageRouteBuilder _fadePageRouteBuilder({
    required Widget child,
    required String name,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, _, __) {
        return MaxWidthBox(
          maxWidth: 1200,
          child: ResponsiveScaledBox(
            width: ResponsiveValue<double>(
              context,
              conditionalValues: [
                Condition.equals(name: MOBILE, value: 450),
                Condition.between(start: 800, end: 1100, value: 800),
                Condition.between(start: 1000, end: 1200, value: 1000),
              ],
            ).value,
            child: ClampingScrollWrapper.builder(context, child),
          ),
        );
      },
      settings: RouteSettings(name: name),
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

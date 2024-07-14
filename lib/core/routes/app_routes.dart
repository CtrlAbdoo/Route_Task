import 'package:flutter/material.dart';
import 'package:route_task/feature/home/presentation/screens/product_screen.dart';



class Routes {
  static const String intitlRoute = '/';


}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const ProductScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}

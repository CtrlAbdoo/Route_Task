import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/utils/app_strings.dart';

import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';


class RouteApp extends StatelessWidget {
  const RouteApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.routeApp,
          theme: getAppTheme(),
          initialRoute: Routes.intitlRoute,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}

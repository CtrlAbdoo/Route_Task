import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/feature/home/presentation/cubits/product_cubit.dart';

import 'app/app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/service/service_locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();

  runApp(
      BlocProvider(
          create: (context) => sl<ProductCubit>()..getAllProduct(),
        child:  const RouteApp(),
      )

  );
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/utils/app_assets.dart';
import 'package:route_task/feature/home/presentation/cubits/product_cubit.dart';
import 'package:route_task/feature/home/presentation/cubits/product_state.dart';

import '../component/product_component.dart';
import '../component/search_and_cart_component.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<ProductCubit>(context);
            return state is GetAllProductLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),

                      // Logo App
                      Image.asset(
                        AppAssets.appLogoSvg,
                        width: 70.w,
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      // Search Product And Add Product To Cart
                      SearchAndCartComponent(
                        cubit: cubit,
                      ),



                      // Products View
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.8),
                          itemCount: cubit.search!.length,
                          itemBuilder: (context, index) {
                            return ProductComponent(
                              image:
                                  cubit.search![index].images.first.toString(),
                              name: cubit.search![index].title,
                              description: cubit.search![index].description,
                              price: cubit.search![index].discountPercentage
                                  .toString(),
                              desPrice: cubit.search![index].price.toString(),
                              rate: cubit.search![index].rating.toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

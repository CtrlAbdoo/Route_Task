import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/utils/app_assets.dart';
import 'package:route_task/feature/home/presentation/cubits/product_cubit.dart';
import 'package:route_task/feature/home/presentation/cubits/product_state.dart';

import '../component/product_component.dart';
import '../component/search_and_cart_component.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            // Implement any listeners if needed
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<ProductCubit>(context);

            if (state is GetAllProductLoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            // Ensure cubit.search is not null before accessing its length
            final products = cubit.search ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),

                // App Logo
                Image.asset(
                  AppAssets.appLogoSvg,
                  width: 70.w,
                ),

                SizedBox(height: 10.h),

                // Search and Cart Component
                SearchAndCartComponent(cubit: cubit),

                // Products View
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductComponent(
                        image: products[index].images.isNotEmpty ? products[index].images.first.toString() : '',
                        name: products[index].title,
                        description: products[index].description,
                        price: products[index].discountPercentage.toString(),
                        desPrice: products[index].price.toString(),
                        rate: products[index].rating.toString(),
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

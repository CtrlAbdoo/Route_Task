import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:route_task/core/widget/heart_icon.dart';

import '../../../../core/utils/app_colors.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.desPrice,
    required this.rate,
  }) : super(key: key);

  final String image;
  final String name;
  final String description;
  final String price;
  final String desPrice;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightBlue,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image And Heart Icon
          Stack(
            alignment: Alignment.topRight,
            children: [
              // Image or Error Icon
              Container(
                width: double.infinity,
                height: 111.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: image.isNotEmpty
                      ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error, size: 25),
                  )
                      : Icon(Icons.error, size: 25),
                ),
              ),
              Positioned(
                top: 3,
                right: 3,
                child: HeartIconButton(),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.primary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.primary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP: $price',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Text(
                        '$desPrice EGP',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.lightBlue,
                          fontSize: 12.sp,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      'Review ($rate)',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      IconlyBold.star,
                      size: 20.sp,
                      color: AppColors.yellow,
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 25.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:route_task/core/constants/colors.dart';

class HeartIconButton extends StatefulWidget {
  @override
  _HeartIconButtonState createState() => _HeartIconButtonState();
}

class _HeartIconButtonState extends State<HeartIconButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                isSelected ? IconlyBold.heart : IconlyLight.heart,
                color: isSelected ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

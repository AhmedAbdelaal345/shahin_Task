import 'package:flutter/material.dart';
import 'package:shahin_task/utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
     this.onPressed,
  });
  final double width;
  final double height;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.blue,
        minimumSize: Size(width * 0.91, height * 0.07),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      ),
      onPressed: onPressed??(){} ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColor.background,
            ),
          ),
          Icon(Icons.arrow_forward, color: AppColor.background),
        ],
      ),
    );
  }
}

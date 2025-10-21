import 'package:flutter/material.dart';
import 'package:shahin_task/utils/app_color.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({super.key, this.isExisting, this.hintText});
  final bool? isExisting;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        decoration: InputDecoration(
          hint: isExisting == true
              ? Text(
                  hintText!,
                  style: TextStyle(
                    color: AppColor.black.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.black.withOpacity(0.1),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.black.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

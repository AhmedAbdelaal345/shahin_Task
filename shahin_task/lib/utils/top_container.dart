import 'package:flutter/material.dart';
import 'package:shahin_task/utils/app_color.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected == true
            ? AppColor.borderContainer.withOpacity(0.5)
            : AppColor.background,
        border: Border.all(
          color: isSelected == true
              ? AppColor.borderContainer
              : Colors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected == true
                ? AppColor.borderContainer
                : Colors.black.withOpacity(0.6),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
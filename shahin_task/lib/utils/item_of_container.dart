import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahin_task/utils/app_color.dart';
import 'package:shahin_task/utils/app_constants.dart';

class ItemOfContainer extends StatelessWidget {
  const ItemOfContainer({
    super.key,
    required this.title,
    required this.svgPath,
    this.thereisColumn = false,
  });
  final String title;
  final String svgPath;
  final bool thereisColumn;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        SvgPicture.asset(svgPath),
        SizedBox(width: width * 0.02),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            if (thereisColumn) ...[
              SizedBox(height: height * 0.005),
            Text(
              "( خلال ال48 ساعة القادمة )",
              style: TextStyle(
                color: AppColor.textRed,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
            ],
          ],
        ),
      ],
    );
  }
}

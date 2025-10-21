import 'package:flutter/material.dart';
import 'package:shahin_task/utils/app_color.dart';

class NumberOfView extends StatelessWidget {
  const NumberOfView({super.key, required this.number});
  final String number;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            width: width * 0.19,
            height: height * 0.067,
            decoration: BoxDecoration(
              color: AppColor.transport.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              border: Border(
                top: BorderSide(color: AppColor.transport, width: 1),
                left: BorderSide(color: AppColor.transport, width: 1),
                right: BorderSide(color: AppColor.transport, width: 1),
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: AppColor.transport,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 3),
          child: SizedBox(
            width: width * 0.197,
            child: Text(
              "ضعف عدد المشاهدات",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textBaseline: TextBaseline.ideographic,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}

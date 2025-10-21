import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahin_task/utils/app_color.dart';
import 'package:shahin_task/utils/app_constants.dart';
import 'package:shahin_task/utils/custom_elevated_button.dart';
import 'package:shahin_task/utils/item_of_container.dart';
import 'package:shahin_task/utils/number_of_view.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool isCheckedBase = false;
  bool isCheckedExtra = false;
  bool isCheckedPlus = false;
  bool isCheckedSuper = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "أختر الباقات اللى تناسبك",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColor.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: AppColor.black,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black.withOpacity(0.5),
                  ),
                ),
              ),
              _baseContainer(height, width),
              _extraContainer(height, width),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: Image.asset(
                        AppConstants.price,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  _plusContainer(height, width),
                ],
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Image.asset(AppConstants.offer),
                  ),
                  _superContainer(height, width),
                ],
              ),
              _bottomContainer(height: height, width: width),
              SizedBox(height: height * 0.08),
              CustomElevatedButton(
                width: width,
                height: height,
                text: "التالي",
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Container _baseContainer(double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      height: height * 0.11,

      width: width * 0.91,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.04),
            blurRadius: 5,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(width: 1, color: AppColor.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isCheckedBase,
                  activeColor: AppColor.bluecheckBox,

                  onChanged: (bool? i) {
                    setState(() {
                      isCheckedBase = i!;
                    });
                  },
                ),
                Text(
                  "أساسية",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                    color: isCheckedBase
                        ? AppColor.bluecheckBox
                        : AppColor.black,
                  ),
                ),
                Spacer(),
                Text(
                  "3,000ج.م",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textContainer,
                  ),
                ),
              ],
            ),
            Divider(indent: width * 0.02, endIndent: width * 0.02),
            Row(
              children: [
                SvgPicture.asset(AppConstants.accute),
                SizedBox(width: width * 0.02),
                Text(
                  "صلاحية الأعلان 30 يوم",
                  style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _extraContainer(double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      height: height * 0.21,

      width: width * 0.91,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.04),
            blurRadius: 5,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(width: 1, color: AppColor.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isCheckedExtra,
                  activeColor: AppColor.bluecheckBox,

                  onChanged: (bool? i) {
                    setState(() {
                      isCheckedExtra = i!;
                    });
                  },
                ),
                Text(
                  "أكسترا",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                    color: isCheckedExtra
                        ? AppColor.bluecheckBox
                        : AppColor.black,
                  ),
                ),
                Spacer(),
                Text(
                  "3,000ج.م",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textContainer,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
            Divider(indent: width * 0.02, endIndent: width * 0.02),
            SizedBox(height: height * 0.01),

            Row(
              children: [
                Column(
                  children: [
                    ItemOfContainer(
                      title: "صلاحية الأعلان 30 يوم",
                      svgPath: AppConstants.accute,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: "رفع لأعلى القائمة كل 3 أيام",
                      svgPath: AppConstants.rocket,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: " تثبيت فى مقاول صحى",
                      svgPath: AppConstants.keep,
                      thereisColumn: true,
                    ),
                  ],
                ),
                Spacer(),
                NumberOfView(number: "7"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _plusContainer(double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      height: height * 0.375,

      width: width * 0.91,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.04),
            blurRadius: 5,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(width: 1, color: AppColor.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Checkbox(
                  value: isCheckedExtra,
                  activeColor: AppColor.bluecheckBox,

                  onChanged: (bool? i) {
                    setState(() {
                      isCheckedExtra = i!;
                    });
                  },
                ),
                Text(
                  "بلس",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                    color: isCheckedExtra
                        ? AppColor.bluecheckBox
                        : AppColor.black,
                  ),
                ),
                Spacer(),
                Text(
                  "3,000ج.م",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textContainer,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
            Divider(indent: width * 0.02, endIndent: width * 0.02),
            SizedBox(height: height * 0.01),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemOfContainer(
                      title: "صلاحية الأعلان 30 يوم",
                      svgPath: AppConstants.accute,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: "رفع لأعلى القائمة كل 3 أيام",
                      svgPath: AppConstants.rocket,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: " تثبيت فى مقاول صحى",
                      svgPath: AppConstants.keep,
                      thereisColumn: true,
                    ),
                    SizedBox(height: height * 0.01),

                    ItemOfContainer(
                      title: "ظهور فى كل محافظات مصر",
                      svgPath: AppConstants.global,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: "أعلان مميز",
                      svgPath: AppConstants.premium,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: " تثبيت فى مقاول صحى",
                      svgPath: AppConstants.keep,
                      thereisColumn: false,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: " تثبيت فى مقاول صحى",
                      svgPath: AppConstants.keep,
                      thereisColumn: true,
                    ),
                  ],
                ),
                Spacer(),
                NumberOfView(number: "18"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _superContainer(double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      height: height * 0.375,

      width: width * 0.91,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.04),
            blurRadius: 5,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(width: 1, color: AppColor.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Checkbox(
                  value: isCheckedExtra,
                  activeColor: AppColor.bluecheckBox,

                  onChanged: (bool? i) {
                    setState(() {
                      isCheckedExtra = i!;
                    });
                  },
                ),
                Text(
                  "سوبر",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                    color: isCheckedExtra
                        ? AppColor.bluecheckBox
                        : AppColor.black,
                  ),
                ),
                Spacer(),
                Text(
                  "3,000ج.م",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textContainer,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
            Divider(indent: width * 0.02, endIndent: width * 0.02),
            SizedBox(height: height * 0.01),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemOfContainer(
                      title: "صلاحية الأعلان 30 يوم",
                      svgPath: AppConstants.accute,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: "رفع لأعلى القائمة كل 3 أيام",
                      svgPath: AppConstants.rocket,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: " تثبيت فى مقاول صحى",
                      svgPath: AppConstants.keep,
                      thereisColumn: true,
                    ),
                    SizedBox(height: height * 0.01),

                    ItemOfContainer(
                      title: "ظهور فى كل محافظات مصر",
                      svgPath: AppConstants.global,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: "أعلان مميز",
                      svgPath: AppConstants.premium,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: " تثبيت فى مقاول صحى",
                      svgPath: AppConstants.keep,
                      thereisColumn: false,
                    ),
                    SizedBox(height: height * 0.01),
                    ItemOfContainer(
                      title: " تثبيت فى مقاول صحى",
                      svgPath: AppConstants.keep,
                      thereisColumn: true,
                    ),
                  ],
                ),
                Spacer(),
                NumberOfView(number: "22"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _bottomContainer extends StatelessWidget {
  const _bottomContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      height: height * 0.11,

      width: width * 0.91,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.04),
            blurRadius: 5,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(width: 1, color: AppColor.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "باقات مخصصة لك",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
            Text(
              "تواصل معنا لأختيار الباقة المناسبة لك",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.black.withOpacity(0.5),
              ),
            ),
            Text(
              "فريق المبيعات",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

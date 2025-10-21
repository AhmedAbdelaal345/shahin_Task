import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahin_task/utils/app_color.dart';
import 'package:shahin_task/utils/app_constants.dart';
import 'package:shahin_task/utils/item_of_container.dart';
import 'package:shahin_task/utils/number_of_view.dart';

class AddAdvertismet extends StatelessWidget {
  const AddAdvertismet({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppConstants.addAdvertisment,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'Add Your Advertisment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Tap the button below to add your advertisement',
              style: TextStyle(fontSize: 16, color: AppColor.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle add advertisement action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.bluecheckBox,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Add Advertisement',
                style: TextStyle(fontSize: 18, color: AppColor.background),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

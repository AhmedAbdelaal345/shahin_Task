import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahin_task/utils/app_color.dart';
import 'package:shahin_task/utils/app_constants.dart';
import 'package:shahin_task/utils/custom_elevated_button.dart';
import 'package:shahin_task/utils/textfield_widget.dart';
import 'package:shahin_task/utils/upper_container.dart';

class FilteringPage extends StatefulWidget {
  const FilteringPage({super.key});

  @override
  State<FilteringPage> createState() => _FilteringPageState();
}

class _FilteringPageState extends State<FilteringPage> {
  final List<String> types = ["الكل", "توين هاوس", "فيلا منفصلة", "تاون هاوس"];
  final List<String> numRoom = ["غرف 4", "5 غرف+", "الكل", "غرفتين", "3 غرف"];
  final List<String> paymentMethod = ["أي", "تقسيط", "كاش"];
  final List<String> states = ["أي", "جاهز", "قيد الانشاء"];

  String selectedType = "الكل";
  String selectedNumRoom = "غرف 4";
  String selectedPayment = "أي";
  String selectedState = "أي";

  

  @override
  void dispose() {
  
    super.dispose();
  }

  void resetFilters() {
    setState(() {
      selectedType = types[0];
      selectedNumRoom = numRoom[0];
      selectedPayment = paymentMethod[0];
      selectedState = states[0];
     
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "فلترة",
            style: TextStyle(
              color: AppColor.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: resetFilters,
              child: Text(
                "رجوع للأفتراضي",
                style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.close, color: AppColor.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.044),
          children: [
            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الفئة",
                style: TextStyle(
                  color: AppColor.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: height * 0.011),
            ListTile(
              leading: SvgPicture.asset(AppConstants.cash),
              title: Text(
                "عقارات",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              subtitle: Text(
                "فلل البيع",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColor.black.withOpacity(0.5),
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                },
                child: Text(
                  "تغيير",
                  style: TextStyle(
                    color: AppColor.bluecheckBox,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.019),
            Divider(thickness: 1, color: AppColor.black.withOpacity(0.1)),
            SizedBox(height: height * 0.019),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.location_on_outlined),
              ),
              title: Text(
                "الموقع",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColor.black,
                ),
              ),
              subtitle: Text(
                "مصر",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColor.black.withOpacity(0.5),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColor.black,
                ),
              ),
            ),
            SizedBox(height: height * 0.019),
            Divider(thickness: 1, color: AppColor.black.withOpacity(0.1)),
            SizedBox(height: height * 0.019),
            Text(
              "الأقساط الشهرية",
              style: TextStyle(
                color: AppColor.black.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: height * 0.011),
            Row(
              children: [
                Flexible(child: TextfieldWidget()),
                SizedBox(width: width * 0.03333),
                Flexible(child: TextfieldWidget()),
              ],
            ),
            SizedBox(height: height * 0.019),
            Text(
              "النوع",
              style: TextStyle(
                color: AppColor.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.011),
            SelectableChips(
              options: types,
              selectedValue: selectedType,
              onSelected: (val) => setState(() => selectedType = val),
              height: height * 0.09,
            ),
            SizedBox(height: height * 0.011),
            SelectableChips(
              options: numRoom,
              selectedValue: selectedNumRoom,
              onSelected: (val) => setState(() => selectedNumRoom = val),
              height: height * 0.09,
            ),
            SizedBox(height: height * 0.019),
            Text(
              "السعر",
              style: TextStyle(
                color: AppColor.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.011),
            Row(
              children: [
                Flexible(
                  child: TextfieldWidget(
                    isExisting: true,
                    hintText: "أقل سعر",
                  ),
                ),
                SizedBox(width: width * 0.03333),
                Flexible(
                  child: TextfieldWidget(
                    isExisting: true,
                    hintText: "أقصى سعر",
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.019),
            Text(
              "طريقة الدفع",
              style: TextStyle(
                color: AppColor.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.011),
            SelectableChips(
              options: paymentMethod,
              selectedValue: selectedPayment,
              onSelected: (val) => setState(() => selectedPayment = val),
              height: height * 0.09,
            ),
            SizedBox(height: height * 0.019),
            Text(
              "حالة العقار",
              style: TextStyle(
                color: AppColor.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.011),
            SelectableChips(
              options: states,
              selectedValue: selectedState,
              onSelected: (val) => setState(() => selectedState = val),
              height: height * 0.09,
            ),
            SizedBox(height: height * 0.074),
            CustomElevatedButton(
              width: width,
              height: height,
              text: "شاهد 10,000+ نتائج",
              onPressed: () {
                final filters = {
                  'type': selectedType,
                  'numRoom': selectedNumRoom,
                  'payment': selectedPayment,
                  'state': selectedState,
                };
              
                Navigator.pop(context, filters);
              },
            ),
            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}

class SelectableChips extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final ValueChanged<String> onSelected;
  final double height;

  const SelectableChips({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = option == selectedValue;
          return GestureDetector(
            onTap: () => onSelected(option),
            child: UpperContainer(
              title: option,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}

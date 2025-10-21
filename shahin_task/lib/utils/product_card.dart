import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahin_task/manager/home_cubit.dart/home_model.dart';
import 'package:shahin_task/utils/app_color.dart';
import 'package:shahin_task/utils/app_constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.newPrice,
    required this.oldPrice,
    required this.imagePath,
  });
  final String title;
  final String newPrice;
  final String oldPrice;
  final String imagePath;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Image.asset(
          widget.imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: height * 0.3,
        ),
        SizedBox(height: height * 0.006),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: height * 0.006),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              widget.newPrice,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.textRed,
              ),
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                widget.oldPrice,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black.withOpacity(0.3),
                  decoration: TextDecoration.lineThrough,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (){
setState(() {
  isFavorite = !isFavorite;
  
});
              },
              icon:isFavorite? Icon(
                Icons.favorite,
                color: AppColor.textRed,
                size: width * 0.05,
              ):Icon(
                Icons.favorite_border,
                color: AppColor.black,
                size: width * 0.05,
              )
            ),
          ],
        ),
        SizedBox(height: height * 0.004),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              AppConstants.localFire,
              color: AppColor.black.withOpacity(0.5),
              width: 12,
              height: 12,
            ),
            const SizedBox(width: 4),
            Text(
              "تم بيع 3.3k+",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColor.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.025),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                AppConstants.companyBadge,
                width: 26,
                height: 26,
              ),
              const Spacer(),

              SizedBox(
                width: 32,
                height: 24,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColor.background,
                    ),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                          color: AppColor.black.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: AppColor.black,
                    size: 16,
                  ),

                  onPressed: () {},
                ),
              ),
              SvgPicture.asset(AppConstants.talat, width: 26, height: 26),
            ],
          ),
        ),
      ],
    );
  }
}

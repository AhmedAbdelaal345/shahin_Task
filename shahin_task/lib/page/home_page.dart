import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahin_task/manager/home_cubit.dart/home_cubit.dart';
import 'package:shahin_task/manager/home_cubit.dart/home_state.dart';
import 'package:shahin_task/utils/app_color.dart';
import 'package:shahin_task/utils/app_constants.dart';
import 'package:shahin_task/utils/product_card.dart';
import 'package:shahin_task/utils/top_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "كل العروض",
    "ملابس",
    "أكسسوارات",
    "الكترونيات",
  ];
  final List<bool> isSelected = [true, false, false, false];
  final List<String> images = [
    AppConstants.manImage,
    AppConstants.clockImage,
    AppConstants.iphoneImage,
    AppConstants.makeUpImage,
    AppConstants.homeImage,
  ];
  final List<String> title = [
    "موضة رجالي",
    "ساعات",
    "موبايلات",
    "منتجات رجالي",
    "منازل",
  ];
  @override
  void initState() {
    // i make this because in initState you can't make this function aysnc
    Future.microtask(() {
      context.read<HomeCubit>().getDataFromFirebase();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeFailure) {
            return Center(child: Text('Error: ${state.error}'));
          }
          if (state is HomeLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.1),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'استكشف العروض',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            context.go(AppConstants.filteringPage);
                          },
                          child: Row(
                            children: [
                              Text(
                                "الكل",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColor.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      height: height * 0.04,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                for (int i = 0; i < isSelected.length; i++) {
                                  isSelected[i] = false;
                                }
                                isSelected[index] = true;
                              });
                            },
                            child: TopContainer(
                              title: categories[index],
                              isSelected: isSelected[index],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: height * 0.02),
                    SizedBox(
                      height: height * 0.09,
                      child: ListView.builder(
                        itemCount: images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: width * 0.2,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColor.black.withOpacity(0.1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(height: height * 0.004),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    title[index],
                                    style: const TextStyle(fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      width: width * 0.911,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: AppColor.borderContainer.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Icon(Icons.check, color: AppColor.transport),
                            Text(
                              "شحن مجانى ",
                              style: TextStyle(
                                color: AppColor.transport,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "لأى عرض تطلبه دلوقتى !",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.44,
                          ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColor.black.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: ProductCard(
                            title: product.title,
                            newPrice: product.newPrice,
                            oldPrice: product.oldPrice,
                            imagePath: product.imagePath,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: Text('مرحبا بك في صفحة العروض'));
        },
      ),
    );
  }
}

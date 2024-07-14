import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbuck_ui/model/category_nodel.dart';


class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  List<CategoryModel> categories = [
    CategoryModel(name: "HOT COFFEE", icon: "assets/images/coffee.png"),
    CategoryModel(name: "DRINKS", icon: "assets/images/drinks.png"),
    CategoryModel(name: "HOT TEAS", icon: "assets/images/tea.png"),
    CategoryModel(name: "BAKERY", icon: "assets/images/bakery.png"),
  ];
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0).r,
      child: Stack(
        children: [
          for (var i = 0; i < categories.length; i++)
            Positioned(
              top: categories.length / 2 > i
                  ? 110.h - (i * 35.h)
                  : 110.h - ((categories.length - 1 - i) * 35.h),
              left: (i * MediaQuery.of(context).size.width + 50.w) /
                  categories.length,
              child: Column(
                children: [
                  Container(
                    width: 65.r,
                    height: 65.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Image.asset(
                          categories[i].icon,
                          width: 40.r,
                        )),
                  ),
                  8.verticalSpace,
                  Text(
                    categories[i].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:starbuck_ui/detaile_page/detaile_page.dart';
import 'package:starbuck_ui/home_page/widget/catagory_items.dart';
import 'package:starbuck_ui/home_page/widget/home_appbar.dart';
import 'package:starbuck_ui/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      _imageSlideController.animateToPage(1,
          duration: const Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    _imageSlideController.dispose();
    _textSlideController.dispose();
    super.dispose();
  }

  final List<ProductModel> products = [
    ProductModel(
        name: "Vanilla Frappuccino",
        price: 24.80,
        image: "assets/images/products/vanila.png"),
    ProductModel(
        name: "Caramel Frappuccino",
        price: 30.00,
        image: "assets/images/products/caramel.png"),
    ProductModel(
        name: "Mocha Coconut Frappuccino",
        price: 45.50,
        image: "assets/images/products/mocha_coconut.png"),
    ProductModel(
        name: "Matcha Green Tea",
        price: 15.75,
        image: "assets/images/products/matcha_green_tea.png"),
    ProductModel(
        name: "Caramelly Intense Frappuccino",
        price: 35.00,
        image: "assets/images/products/caramelly_intense.png"),
    ProductModel(
        name: "Milkshake",
        price: 12.00,
        image: "assets/images/products/milkshake.png"),
  ];

  final PageController _textSlideController = PageController();
  final PageController _imageSlideController = PageController(
    viewportFraction: 0.52,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        preferredSize: Size(0, 56.h),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, bottom: 1, top: 10).r,
            child: Text(
              "Smooth Out Your Everyday",
              style: TextStyle(
                  fontSize: 34.spMin,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: TopOvalClipper(),
              child: Container(
                width: 1.sw,
                height: MediaQuery.of(context).size.height * 0.78,
                color: const Color(0xFF40976C),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const CategoryItems(),
                    ClipPath(
                      clipper: TopOvalClipper(),
                      child: Container(
                        width: 1.sw, // Take full screen width
                        height: 0.62.sh,
                        color: const Color(0xFF45A274),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _imageSlideController,
                      builder: (BuildContext context, Widget? child) {
                        return PageView.builder(
                          itemCount: products.length,
                          controller: _imageSlideController,
                          onPageChanged: (page) {
                            _textSlideController.animateToPage(page,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          itemBuilder: (context, index) {
                            double value = 0.0;

                            if (_imageSlideController.position.haveDimensions) {
                              value = index.toDouble() -
                                  (_imageSlideController.page ?? 0);
                              value = (value * 0.7).clamp(-1, 1);
                            }

                            return Transform.translate(
                              offset: Offset(0, 50 + (value.abs() * 200)),
                              child: Transform.scale(
                                scale: 1 - (value.abs() * 0.05),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                                product: products[index],
                                              )),
                                    );
                                  },
                                  child: Center(
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          width: 0.5.sw,
                                          // Take half of the screen width
                                          height: 0.82.sw,
                                          // Take half of the screen width
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF4BB681),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        ClipPath(
                                          clipper: BottomOvalClipper(),
                                          child: Image.asset(
                                            products[index].image,
                                            width: 0.5.sw,
                                            height: 0.7.sw,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 100,
                          child: PageView.builder(
                            itemCount: products.length,
                            controller: _textSlideController,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    products[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.spMin,
                                        height: 1.1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "\$${products[index % products.length].price.toStringAsFixed(2)}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: _imageSlideController,
                          count: products.length,
                          effect: ScrollingDotsEffect(
                              spacing: 15.0,
                              radius: 8.0,
                              fixedCenter: true,
                              dotWidth: 5.0,
                              dotHeight: 5.0,
                              activeDotScale: 3,
                              dotColor: Colors.grey[400]!,
                              activeDotColor: Colors.white),
                        ),
                        30.verticalSpace
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, ScreenUtil().setHeight(120)); // Move to the left-middle
    path.quadraticBezierTo(
        size.width * 0.5, 0, size.width, ScreenUtil().setHeight(120));
    path.lineTo(size.width, size.height); // Draw a line to the bottom-right
    path.lineTo(0, size.height); // Draw a line to the bottom-left
    path.close(); // Close the path to complete the clip shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BottomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - ScreenUtil().setWidth(120)); // Move to the left-bottom
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height - ScreenUtil().setWidth(120));
    path.lineTo(size.width, 0); // Draw a line to the top-right
    path.lineTo(0, 0); // Draw a line to the top-left
    path.close(); // Close the path to complete the clip shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) => false;
}

class MyCircularClippedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: CircleClipper(),
          child: Container(
            width: 0.5.sw, // Take half of the screen width
            height: 0.5.sw, // Take half of the screen width
            decoration: BoxDecoration(
              color: Color(0xFF4BB681),
            ),
          ),
        ),
      ),
    );
  }
}

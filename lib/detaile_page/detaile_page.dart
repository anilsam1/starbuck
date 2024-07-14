import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbuck_ui/detaile_page/widget/detail_appbar.dart';
import 'package:starbuck_ui/detaile_page/widget/order_button.dart';
import 'package:starbuck_ui/detaile_page/widget/product_size.dart';
import 'package:starbuck_ui/model/product_model.dart';
import 'package:starbuck_ui/model/size_model.dart';
import 'package:starbuck_ui/widget/fade_In_down.dart';

import '../home_page/home_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<SizeModel> sizes = [
    SizeModel(name: "Tall", qty: "12 Fl Oz"),
    SizeModel(name: "Grande", qty: "16 Fl Oz"),
    SizeModel(name: "Venti", qty: "24 Fl Oz"),
    SizeModel(name: "Custom", qty: "__ Fl Oz"),
  ];

  int selectedSize = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DetailsAppBar(),
                SizedBox(
                  height: 0.52.sh,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: 0.7.sw,
                    height: 0.6.sh,
                    color: Colors.transparent,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 0.7.sw,
                          // Take half of the screen width
                          height: 1.sw * 1.03,
                          // Take half of the screen width
                          decoration: const BoxDecoration(
                            color: Color(0xFF4BB681),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Hero(
                          tag: widget.product.name,
                          child: ClipPath(
                            clipper: BottomOvalClipper(),
                            child: Image.asset(
                              widget.product.image,
                              width: 0.6.sw,
                              height: 0.9.sw,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 500),
                  from: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          widget.product.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${widget.product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 28,
                                color: Color(0xFF40976C),
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Best Sale",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 500),
                  from: 50,
                  child: const Text(
                    "Size Options",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 500),
                  from: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var i = 0; i < sizes.length; i++)
                          GestureDetector(
                            onTap: () => setState(() {
                              selectedSize = i;
                            }),
                            child: ProductSize(
                                isSelected: selectedSize == i,
                                iconSize: 25 + (i * 5),
                                sizes: sizes[i]),
                          ),
                      ],
                    ),
                  ),
                ),
          
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const OrderButton(),
    );
  }
}
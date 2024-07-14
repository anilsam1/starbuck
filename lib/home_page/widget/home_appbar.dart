import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbuck_ui/generated/assets.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.preferredSize});

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          13.horizontalSpace,

          Image.asset(Assets.imagesCup, height: 50, width: 50,),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Quwaha", style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black)),
              Text("Space",style: TextStyle(color: Colors.black))
            ],
          ),
          const Spacer(),
          Image.asset(Assets.imagesBasket, height: 30, width: 30,),
          13.horizontalSpace,
        ],
      ),
    );
  }
}

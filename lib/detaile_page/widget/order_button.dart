import 'package:flutter/material.dart';
import 'package:starbuck_ui/widget/fade_In_down.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 500),
      from: 50,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF40976C),
                      minimumSize: const Size(35, 35),
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      shape: const CircleBorder(),
                      elevation: 0),
                  onPressed: () {},
                  child: const Text('-', style: TextStyle(fontSize: 18)),
                ),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF40976C)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF40976C),
                      minimumSize: const Size(35, 35),
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      shape: const CircleBorder(),
                      elevation: 0),
                  onPressed: () {},
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF40976C),
                  minimumSize: const Size(180, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  elevation: 0),
              onPressed: () {},
              child: const Text('Add to Order', style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
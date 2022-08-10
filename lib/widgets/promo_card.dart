import 'package:flutter/cupertino.dart';
import 'package:masmas_food/global/app_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      decoration: BoxDecoration(
        color: greenColor2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/images/Promo Advertising.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

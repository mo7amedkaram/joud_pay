import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset(
          "assets/images/arrow-left-02.svg",
        ),
      ),
    );
  }
}

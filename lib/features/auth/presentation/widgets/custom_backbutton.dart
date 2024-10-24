import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.canPop()) {
          GoRouter.of(context).pop();
        } else {
          Fluttertoast.showToast(msg: "Can't return");
        }
      },
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

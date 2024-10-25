import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/app_style.dart';

class GetLocationScareen extends StatelessWidget {
  const GetLocationScareen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/Around the world-rafiki 1.svg",
              height: 350,
              width: 350,
            ),
            const SizedBox(
              height: 9,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Allow access to your location",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleSemiBold18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 39),
              child: Text(
                  "Enabling access to your location helps us secure your account and deliver services closer to you",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleMedium12),
            ),
            const SizedBox(
              height: 140,
            ),
            const AllowAccessButton(),
          ],
        ),
      ),
    );
  }
}

class AllowAccessButton extends StatelessWidget {
  const AllowAccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF44187D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {
          context.push("/select_sms_screen");
        },
        child: const Text(
          'Allow access',
          style: AppStyles.styleRegular16,
        ),
      ),
    );
  }
}

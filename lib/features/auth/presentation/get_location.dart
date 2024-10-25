import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/app_style.dart';

class GetLocationScreen extends StatelessWidget {
  const GetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: _buildBody(),
      );

  Widget _buildBody() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _LocationImage(),
            SizedBox(height: 9),
            _TitleText(),
            _DescriptionText(),
            SizedBox(height: 140),
            AllowAccessButton(),
          ],
        ),
      );
}

class _LocationImage extends StatelessWidget {
  const _LocationImage();

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        "assets/images/Around the world-rafiki 1.svg",
        height: 350,
        width: 350,
      );
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          "Allow access to your location",
          textAlign: TextAlign.center,
          style: AppStyles.styleSemiBold18,
        ),
      );
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 39),
        child: Text(
          "Enabling access to your location helps us secure your account and deliver services closer to you",
          textAlign: TextAlign.center,
          style: AppStyles.styleMedium12,
        ),
      );
}

class AllowAccessButton extends StatelessWidget {
  const AllowAccessButton({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF44187D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () => context.push("/select_sms_screen"),
          child: const Text(
            'Allow access',
            style: AppStyles.styleRegular16,
          ),
        ),
      );
}

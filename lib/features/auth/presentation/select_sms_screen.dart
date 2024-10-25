import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/app_style.dart';

class SelectSmsScreen extends StatelessWidget {
  const SelectSmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                    width: 130,
                    height: 62,
                    child: SvgPicture.asset("assets/images/colored_logo.svg")),
              ),
              const SizedBox(
                height: 40,
              ),
              const SmsContainer(
                smsName: "SIM 01",
              ),
              const SizedBox(
                height: 8,
              ),
              const SmsContainer(
                smsName: "SIM 02",
              ),
              const SizedBox(
                height: 34,
              ),
              const Text(
                "To complete the registration process, an SMS will be sent to verify your mobile number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF44187D),
                  fontSize: 12,
                  fontFamily: 'IBM Plex Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 76,
              ),
              const SendSmsButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SendSmsButton extends StatelessWidget {
  const SendSmsButton({super.key});

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
          context.push("/enter_otp_screen");
        },
        child: const Text(
          'Send SMS',
          style: AppStyles.styleRegular16,
        ),
      ),
    );
  }
}

class SmsContainer extends StatelessWidget {
  final String smsName;
  const SmsContainer({super.key, required this.smsName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFF2F2F2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFF2F2F2),
            child: SvgPicture.asset("assets/images/sms_icon.svg"),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            smsName,
            style: AppStyles.styleMedium14,
          ),
        ],
      ),
    );
  }
}

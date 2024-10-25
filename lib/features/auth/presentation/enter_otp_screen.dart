import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:joud_pay/features/auth/presentation/widgets/custom_backbutton.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: ListView(
            children: [
              _buildTitleAndInstructions(),
              const SizedBox(height: 40),
              _buildOtpField(),
              const SizedBox(height: 40),
              _buildConfirmButton(context),
              const SizedBox(height: 40),
              _buildTimerAndResend(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: const SizedBox(),
      leadingWidth: 37,
      leading: const Padding(
        padding: EdgeInsets.only(left: 13),
        child: CustomBackButton(),
      ),
    );
  }

  Widget _buildTitleAndInstructions() {
    return const Column(
      children: [
        Text(
          'Enter OTP',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF44187D),
            fontSize: 25,
            fontFamily: 'IBM Plex Sans',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 24),
        Text('Please, enter the verification code',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'IBM Plex Sans',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center),
        Text(
          'we sent to your mobile **57',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'IBM Plex Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildOtpField() {
    return OtpTextField(
      numberOfFields: 5,
      focusedBorderColor: Color(0xFF44187D),
      cursorColor: Colors.black,
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(12),
      fieldHeight: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      onCodeChanged: (String code) {
        // handle validation or checks here
      },
      onSubmit: (String verificationCode) {
        // handle submission
      },
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // Implement confirmation logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF44187D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text(
          "Confirm",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTimerAndResend() {
    return const Column(
      children: [
        Text(
          '01:24',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF44187D),
            fontSize: 16,
            fontFamily: 'IBM Plex Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Resend again?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xCC949494),
            fontSize: 16,
            fontFamily: 'IBM Plex Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

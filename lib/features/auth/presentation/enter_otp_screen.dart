import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:joud_pay/features/auth/presentation/widgets/custom_backbutton.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: _buildBody(),
      );

  PreferredSizeWidget _buildAppBar() => AppBar(
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

  Widget _buildBody() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: ListView(
            children: [
              _buildTitle(),
              _buildInstructions(),
              const SizedBox(height: 40),
              _buildOtpField(),
              const SizedBox(height: 40),
              _buildConfirmButton(),
              const SizedBox(height: 40),
              _buildTimer(),
              const SizedBox(height: 12),
              _buildResendText(),
            ],
          ),
        ),
      );

  Widget _buildTitle() => const Text(
        'Enter OTP',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF44187D),
          fontSize: 25,
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w700,
        ),
      );

  Widget _buildInstructions() => const Column(
        children: [
          SizedBox(height: 24),
          Text(
            'Please, enter the verification code',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'IBM Plex Sans',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
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

  Widget _buildOtpField() => OtpTextField(
        numberOfFields: 5,
        focusedBorderColor: const Color(0xFF44187D),
        cursorColor: Colors.black,
        showFieldAsBox: true,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 70,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        onCodeChanged: (code) {/* handle validation */},
        onSubmit: (code) {/* handle submission */},
      );

  Widget _buildConfirmButton() => Builder(
        builder: (context) => SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () => context.push("/create_account_screen"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF44187D),
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
        ),
      );

  Widget _buildTimer() => const Text(
        '01:24',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF44187D),
          fontSize: 16,
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _buildResendText() => const Text(
        'Resend again?',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xCC949494),
          fontSize: 16,
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w400,
        ),
      );
}

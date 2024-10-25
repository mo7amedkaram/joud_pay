import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:joud_pay/features/auth/presentation/widgets/custom_text_field.dart';
import 'widgets/choose_age_widget.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isAccepted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showAgeDialog());
  }

  void _showAgeDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        insetPadding: const EdgeInsets.all(16),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: ChooseAgeDialog(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              _buildLogo(),
              const SizedBox(height: 31),
              _buildTitle(),
              const SizedBox(height: 16),
              _buildForm(),
              const SizedBox(height: 45),
              _buildSignupButton(context),
              const SizedBox(height: 40),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() => Center(
        child: SizedBox(
          width: 130,
          height: 62,
          child: SvgPicture.asset("assets/images/colored_logo.svg"),
        ),
      );

  Widget _buildTitle() => const Text(
        "Create your new account",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'IBMPlexSans',
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _buildForm() => Column(
        children: [
          const CustomTextField(
            hintText: "Enter Full name",
            isObsecureText: false,
            prefixIcon: "assets/images/user.svg",
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            hintText: "Enter ID Number",
            isObsecureText: false,
            prefixIcon: "assets/images/id_icon.svg",
          ),
          const SizedBox(height: 16),
          _buildLocationRow(),
          const SizedBox(height: 16),
          _buildTermsCheckbox(),
        ],
      );

  Widget _buildLocationRow() => Row(
        children: [
          SvgPicture.asset("assets/images/location_icon.svg"),
          const SizedBox(width: 6),
          const Text(
            "Egypt",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );

  Widget _buildTermsCheckbox() => Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: _isAccepted,
              activeColor: const Color(0xFF44187D),
              onChanged: (value) => setState(() => _isAccepted = value!),
              side: const BorderSide(color: Color(0xFFE9E9E9)),
            ),
          ),
          const SizedBox(width: 8),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'you are accepting ',
                  style: TextStyle(
                    color: Color(0xFF383737),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'terms & conditions',
                  style: TextStyle(
                    color: Color(0xFF44187D),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildFooter() => Column(
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Already have on account ?',
                  style: TextStyle(
                    color: Color(0xFF161616),
                    fontSize: 14,
                    fontFamily: 'IBMPlexSansArabic',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' Sign in',
                  style: TextStyle(
                    color: Color(0xFF44187D),
                    fontSize: 14,
                    fontFamily: 'IBMPlexSansArabic',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          const Text(
            "or",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 19),
          _buildLoginWithEid(),
        ],
      );

  Widget _buildLoginWithEid() => Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF44187D)),
        ),
        child: const Center(
          child: Text(
            'Login e-ID',
            style: TextStyle(
              color: Color(0xFF44187D),
              fontSize: 16,
              fontFamily: 'IBMPlexSansArabic',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}

Widget _buildSignupButton(BuildContext context) => SizedBox(
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
          "Sign up for free",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/app_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: "Payments between individuals",
      image: "assets/images/onboard1.svg",
      text:
          "payment between individuals an easy as it provides  with a secure experience in sending , receiving money",
    ),
    OnboardingData(
      title: "Scan feature for secure payment",
      image: "assets/images/onboard2.svg",
      text:
          "Pay your bill or complete your purchase with one click, and enjoy the ease and speed of the experience",
    ),
    OnboardingData(
      title: "Transfer money to compaines",
      image: "assets/images/oboard3.svg",
      text:
          "With our application, we provide all guarantees for transferring money to any company you choose",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildSkipButton(context),
              ],
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) =>
                    OnboardingContent(data: _onboardingData[index]),
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildBottomSection(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 49),
        _buildPageIndicator(),
        const SizedBox(height: 62),
        _isLastPage ? _buildActionButton(context) : const SizedBox(),
        const Spacer(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingData.length,
        (index) => _buildDot(index: index),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () => _handleActionButtonPress(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF44187D),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Text(
            _isLastPage ? "Get Started" : "Next",
            style: AppStyles.styleRegular16,
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return TextButton(
      onPressed: () => _navigateToLoginScreen(context),
      child: const Text(
        "Skip",
        style: TextStyle(
          color: Color(0xFF44187D),
          fontSize: 16,
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w400,

          //  decoration: TextDecoration.underline,
          letterSpacing: -0.17,
        ),
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: 20,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFF553B8A) : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  void _handleActionButtonPress(BuildContext context) async {
    if (_isLastPage) {
      context.go("/select_country");
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Future<void> _navigateToLoginScreen(BuildContext context) async {}

  bool get _isLastPage => _currentPage == _onboardingData.length - 1;
}

class OnboardingData {
  final String image;
  final String text;
  final String title;

  OnboardingData({
    required this.image,
    required this.text,
    required this.title,
  });
}

class OnboardingContent extends StatelessWidget {
  final OnboardingData data;

  const OnboardingContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        SvgPicture.asset(
          data.image,
          height: 250,
          width: 250,
        ),
        const SizedBox(
          height: 51,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(data.title,
              textAlign: TextAlign.center, style: AppStyles.styleSemiBold18),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39),
          child: Text(data.text,
              textAlign: TextAlign.center, style: AppStyles.styleMedium12),
        ),
      ],
    );
  }
}

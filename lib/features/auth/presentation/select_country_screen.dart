import 'package:flutter/material.dart';

import '../../../utils/app_style.dart';
import 'widgets/country_option.dart';
import 'widgets/custom_backbutton.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  String? _selectedCountry = 'Egypt'; // Selected country
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              // List of country options
              _buildCountryOptions(),
              const Spacer(),
              const NextButton(),
              const SizedBox(
                height: 38,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountryOptions() {
    final List<Map<String, String>> countries = [
      {'flag': '🇪🇬', 'name': 'Egypt'},
      {'flag': '🇬🇧', 'name': 'United Kingdom'},
      {'flag': '🇵🇸', 'name': 'Palestine'},
      {'flag': '🇸🇦', 'name': 'Kingdom of Saudi Arabia'},
    ];

    return Column(
      children: countries
          .map(
            (country) => CountryOption(
              flag: country['flag']!,
              countryName: country['name']!,
              isSelected: _selectedCountry == country['name'],
              onTap: () => _onCountrySelected(country['name']!),
            ),
          )
          .toList(),
    );
  }

  // Handle country selection
  void _onCountrySelected(String country) {
    setState(() {
      _selectedCountry = country;
    });
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: const Text("Select Country", style: AppStyles.styleMedium18),
    leadingWidth: 37,
    leading: const Padding(
      padding: EdgeInsets.only(left: 13),
      child: CustomBackButton(),
    ),
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(1.0), // Divider height
      child: Divider(
        color: Colors.grey, // Color of the divider
        thickness: 1.0, // Thickness of the divider
        height: 1.0, // Height of the divider widget
      ),
    ),
  );
}

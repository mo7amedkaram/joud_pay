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
  static const List<Map<String, String>> _countries = [
    {'flag': '🇪🇬', 'name': 'Egypt'},
    {'flag': '🇬🇧', 'name': 'United Kingdom'},
    {'flag': '🇵🇸', 'name': 'Palestine'},
    {'flag': '🇸🇦', 'name': 'Kingdom of Saudi Arabia'},
  ];

  String _selectedCountry = 'Egypt';

  void _onCountrySelected(String country) {
    setState(() => _selectedCountry = country);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: _buildBody(),
      );

  PreferredSizeWidget _buildAppBar() => AppBar(
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
          preferredSize: Size.fromHeight(1),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
        ),
      );

  Widget _buildBody() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const SizedBox(height: 24),
              _buildCountryList(),
              const Spacer(),
              const NextButton(),
              const SizedBox(height: 38),
            ],
          ),
        ),
      );

  Widget _buildCountryList() => Column(
        children: _countries
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

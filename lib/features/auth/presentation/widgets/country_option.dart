import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/app_style.dart';

class CountryOption extends StatelessWidget {
  final String flag;
  final String countryName;
  final bool isSelected;
  final VoidCallback onTap;

  const CountryOption({
    super.key,
    required this.flag,
    required this.countryName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: _buildBoxDecoration(),
        child: Row(
          children: <Widget>[
            _buildRadioButton(),
            const SizedBox(width: 10),
            Text(flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 10),
            Text(countryName),
          ],
        ),
      ),
    );
  }

  // Build decoration for the container
  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color:
          isSelected ? const Color.fromRGBO(69, 25, 125, 0.10) : Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(
        color: isSelected ? const Color(0xFF44187D) : Colors.grey,
        width: 1.0,
      ),
    );
  }

  // Build radio button
  Widget _buildRadioButton() {
    return Radio<String>(
      splashRadius: 20,
      value: countryName,
      groupValue: isSelected ? countryName : null,
      onChanged: (String? value) {
        onTap();
      },
      activeColor: const Color(0xFF44187D),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

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
          context.push("/get_location");
        },
        child: const Text(
          'Next',
          style: AppStyles.styleRegular16,
        ),
      ),
    );
  }
}

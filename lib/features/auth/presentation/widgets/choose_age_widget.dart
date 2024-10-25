import 'package:flutter/material.dart';

class ChooseAgeDialog extends StatefulWidget {
  const ChooseAgeDialog({super.key});

  @override
  State<ChooseAgeDialog> createState() => _ChooseAgeDialogState();
}

class _ChooseAgeDialogState extends State<ChooseAgeDialog> {
  String? _selectedAgeGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Choose your age group",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w600,
          ),
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0), // إزالة المسافة الرأسية
          horizontalTitleGap: 12, // المسافة الأفقية بين النص والـ Radio
          title: const Text(
            "Age over 15",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'IBM Plex Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Transform.scale(
            scale: 1.5, // تكبير حجم الدائرة
            child: Radio<String>(
              value: "Age over 15",
              groupValue: _selectedAgeGroup,
              onChanged: (String? value) {
                setState(() {
                  _selectedAgeGroup = value;
                });
              },
              activeColor: const Color(0xFF44187D), // تغيير لون الـ Radio
              visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4), // تقليل المسافة بين النص والـ Radio
            ),
          ),
        ),
        SizedBox(height: 4), // تقليل المسافة بين الخيارين
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0), // إزالة المسافة الرأسية
          horizontalTitleGap: 12, // المسافة الأفقية بين النص والـ Radio
          title: const Text(
            "Age over 18",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'IBM Plex Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Transform.scale(
            scale: 1.5, // تكبير حجم الدائرة
            child: Radio<String>(
              value: "Age over 18",
              groupValue: _selectedAgeGroup,
              onChanged: (String? value) {
                setState(() {
                  _selectedAgeGroup = value;
                });
              },
              activeColor: const Color(0xFF44187D), // تغيير لون الـ Radio
              visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4), // تقليل المسافة بين النص والـ Radio
            ),
          ),
        ),
      ],
    );
  }
}

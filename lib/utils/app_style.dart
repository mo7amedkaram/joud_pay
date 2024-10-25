import 'package:flutter/material.dart';

abstract class AppStyles {
  //-----------
  static const styleMedium12 = TextStyle(
    color: Color.fromRGBO(147, 147, 147, 1),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat",
    height: 1.9,
  );
  //-----------
  static const styleMedium18 = TextStyle(
    color: Color(0xff2F1155),
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'IBM Plex Sans',
  );
  //-----------
  static const styleMedium14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'IBMPlexSansArabic',
  );

  //-----------------
  static const styleSemiBold18 = TextStyle(
    color: Color(0xff2F1155),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: "IBM Plex Sans",
  );
  //-----------
  static const styleRegular16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: "IBM Plex Sans",
  );
}

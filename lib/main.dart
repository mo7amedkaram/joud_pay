import 'package:flutter/material.dart';
import 'package:joud_pay/core/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Joud Pay',
      routerConfig: AppRoute.router,
    );
  }
}

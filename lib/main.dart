import 'package:flutter/material.dart';
import 'package:payment_gateway_learn/features/checkout/presentation/pages/my_cart_page.dart';

import 'core/theme/styles.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(centerTitle: true, titleTextStyle: AppStyles.medium25),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF34A853),
            foregroundColor: Colors.black,
            textStyle: AppStyles.medium25.copyWith(fontSize: 22),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 23),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: const Size.fromWidth(double.infinity),
            minimumSize: const Size.fromHeight(73),
            maximumSize: const Size.fromHeight(73),
          ),
        ),
      ),
      home: const MyCartPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/observers/bloc_observer.dart';
import 'core/theme/styles.dart';
import 'features/checkout/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "important_data.env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  Bloc.observer = MyBlocObserver();
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

import 'package:flutter/material.dart';

import '../../../../core/theme/styles.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset('assets/images/basket.png', height: 424),
            const SizedBox(height: 15),
            Column(
              spacing: 3,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Order Subtotal', style: AppStyles.regular18),
                    Text('\$42.97', style: AppStyles.regular18),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Discount', style: AppStyles.regular18),
                    Text('\$0', style: AppStyles.regular18),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Shipping', style: AppStyles.regular18),
                    Text('\$8', style: AppStyles.regular18),
                  ],
                ),
              ],
            ),
            Divider(height: 30, thickness: 2, indent: 15, endIndent: 15, color: Color(0xFFC7C7C7)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total', style: AppStyles.semibold24),
                Text('\$50.97', style: AppStyles.semibold24),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle payment completion logic here
              },
              child: Text("Complete Payment"),
            ),
          ],
        ),
      ),
    );
  }
}

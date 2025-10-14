part of '../../imports.dart';

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
                OrderInfoItem(label: "Order Subtotal", value: 43.97),
                OrderInfoItem(label: "Discount", value: 0),
                OrderInfoItem(label: 'Shipping', value: 8),
              ],
            ),
            Divider(height: 30, thickness: 2, indent: 15, endIndent: 15, color: Color(0xFFC7C7C7)),
            OrderInfoItem(label: 'Total', value: 50.97, style: AppStyles.semibold24),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final payMethod = await showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                  builder: (context) => PaymentDetailsBottomSheet(),
                );
                if (payMethod == 'card' && context.mounted) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaymentSuccessPage()));
                }
              },
              child: Text("Complete Payment"),
            ),
          ],
        ),
      ),
    );
  }
}

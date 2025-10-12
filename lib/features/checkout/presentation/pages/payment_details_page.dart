part of '../../imports.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaymentMethodWidget(imagePath: 'assets/images/visa-card.png'),
                PaymentMethodWidget(isSelected: true, imagePath: 'assets/images/paypal.png'),
                PaymentMethodWidget(imagePath: 'assets/images/apple_pay.png'),
              ],
            ),
            const Text('Payment Method', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Credit Card', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text('Billing Address', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('John Doe\n123 Main St\nCity, State, 12345', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key, this.isSelected = false, required this.imagePath});

  final bool isSelected;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 103,
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: isSelected ? Color(0xff34a853) : Colors.black.withValues(alpha: 0.5), width: isSelected ? 1.5 : 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [if (isSelected) BoxShadow(color: Color(0xff34a853).withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 4))],
      ),
      child: Center(child: Image.asset(imagePath, height: 40, fit: BoxFit.contain)),
    );
  }
}

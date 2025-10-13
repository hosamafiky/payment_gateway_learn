part of '../../imports.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> paymentMethods = ['assets/images/visa-card.png', 'assets/images/paypal.png'];
  int selectedMethodIndex = 0;
  void selectPaymentMethod(int index) {
    setState(() {
      selectedMethodIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 72,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: paymentMethods.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, idx) {
                  return GestureDetector(
                    onTap: () => selectPaymentMethod(idx),
                    child: PaymentMethodWidget(isSelected: selectedMethodIndex == idx, imagePath: paymentMethods[idx]),
                  );
                },
              ),
            ),
            CreditCardSection(formKey: formKey),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // Validate form
                  if (formKey.currentState!.validate()) {
                    // Process payment
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Payment...')));
                  }
                },
                child: Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

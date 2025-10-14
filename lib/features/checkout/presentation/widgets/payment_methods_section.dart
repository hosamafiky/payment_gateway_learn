part of '../../imports.dart';

class PaymentMethodsSection extends StatefulWidget {
  const PaymentMethodsSection({super.key});

  @override
  State<PaymentMethodsSection> createState() => _PaymentMethodsSectionState();
}

class _PaymentMethodsSectionState extends State<PaymentMethodsSection> {
  int selectedMethodIndex = 0;
  List<String> paymentMethods = ['assets/images/visa-card.png', 'assets/images/paypal.png'];

  void selectPaymentMethod(int index) {
    setState(() {
      selectedMethodIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

part of '../../imports.dart';

class PaymentMethodsSection extends StatefulWidget {
  const PaymentMethodsSection({super.key, required this.onMethodSelected});

  final ValueChanged<String> onMethodSelected;

  @override
  State<PaymentMethodsSection> createState() => _PaymentMethodsSectionState();
}

class _PaymentMethodsSectionState extends State<PaymentMethodsSection> {
  String selectedMethodIndex = 'visa-card';
  List<String> paymentMethods = ['assets/images/visa-card.png', 'assets/images/paymob.png'];

  void selectPaymentMethod(String method) {
    setState(() => selectedMethodIndex = method);
    widget.onMethodSelected(method);
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
          final method = paymentMethods[idx].split('/').last.split('.').first;
          return GestureDetector(
            onTap: () => selectPaymentMethod(method),
            child: PaymentMethodWidget(isSelected: selectedMethodIndex == method, imagePath: paymentMethods[idx]),
          );
        },
      ),
    );
  }
}

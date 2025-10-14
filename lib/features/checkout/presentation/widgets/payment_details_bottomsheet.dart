part of '../../imports.dart';

class PaymentDetailsBottomSheet extends StatelessWidget {
  const PaymentDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15).copyWith(bottom: MediaQuery.viewPaddingOf(context).bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          PaymentMethodsSection(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop('card');
            },
            child: Text("Pay with Card"),
          ),
        ],
      ),
    );
  }
}

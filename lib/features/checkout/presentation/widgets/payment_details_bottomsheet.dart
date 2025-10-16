part of '../../imports.dart';

class PaymentDetailsBottomSheet extends StatefulWidget {
  const PaymentDetailsBottomSheet({super.key});

  @override
  State<PaymentDetailsBottomSheet> createState() => _PaymentDetailsBottomSheetState();
}

class _PaymentDetailsBottomSheetState extends State<PaymentDetailsBottomSheet> {
  String selectedMethod = 'visa-card';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15).copyWith(bottom: MediaQuery.viewPaddingOf(context).bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          PaymentMethodsSection(onMethodSelected: (method) => selectedMethod = method),
          BlocSelector<CheckoutCubit, CheckoutState, CheckoutStatus>(
            selector: (state) => state.status,
            builder: (context, status) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(selectedMethod);
                },
                child: status == CheckoutStatus.loading ? CircularProgressIndicator.adaptive() : Text("Pay with Card"),
              );
            },
          ),
        ],
      ),
    );
  }
}

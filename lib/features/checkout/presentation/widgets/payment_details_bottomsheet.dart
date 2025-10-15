part of '../../imports.dart';

class PaymentDetailsBottomSheet extends StatelessWidget {
  const PaymentDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state.status == CheckoutStatus.success && state.message != null) {
          Navigator.of(context).pop('success');
        } else if (state.status == CheckoutStatus.failure && state.failure != null) {
          Navigator.of(context).pop(state.failure!.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15).copyWith(bottom: MediaQuery.viewPaddingOf(context).bottom + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            PaymentMethodsSection(),
            BlocSelector<CheckoutCubit, CheckoutState, CheckoutStatus>(
              selector: (state) => state.status,
              builder: (context, status) {
                return ElevatedButton(
                  onPressed: () {
                    final params = PaymentIntentParams(amount: 50.97, currencyISOCode: 'USD');
                    context.read<CheckoutCubit>().handlePayment(params);
                  },
                  child: status == CheckoutStatus.loading ? CircularProgressIndicator.adaptive() : Text("Pay with Card"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

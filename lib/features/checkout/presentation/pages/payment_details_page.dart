part of '../../imports.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Details')),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: PaymentMethodsSection()),
          SliverToBoxAdapter(child: CreditCardSection(formKey: formKey)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 12 + MediaQuery.viewPaddingOf(context).bottom),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate form
                    if (formKey.currentState!.validate()) {
                      // Save form state
                      formKey.currentState!.save();
                      // Process payment
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaymentSuccessPage()));
                    }
                  },
                  child: Text('Pay Now'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

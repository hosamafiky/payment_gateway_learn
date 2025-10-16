part of '../../imports.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final StripeHelper stripeHelper = StripeHelper();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(repository: CheckoutRepositoryImpl()),
      child: BlocListener<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state.status == CheckoutStatus.success && state.message != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentSuccessPage()));
          } else if (state.status == CheckoutStatus.failure && state.failure != null) {
            final isError = state.failure!.message.contains('Exception');
            final isCanceled = state.failure!.message.contains('canceled');
            if (isCanceled) return;
            if (isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.failure!.message),
                  duration: Duration(seconds: isError ? 20 : 3),
                  backgroundColor: isError ? Colors.redAccent : null,
                ),
              );
            }
          }
        },
        child: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, _) {
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
                        final method = await showModalBottomSheet<String?>(
                          context: context,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                          builder: (context) => BlocProvider(
                            create: (context) => CheckoutCubit(repository: CheckoutRepositoryImpl()),
                            child: PaymentDetailsBottomSheet(),
                          ),
                        );

                        if (method != null) {
                          if (context.mounted) {
                            switch (method) {
                              case 'visa-card':
                                final params = PaymentIntentParams(amount: 50.97, currencyISOCode: 'USD');
                                context.read<CheckoutCubit>().handlePayment(params);
                                break;
                              case 'paymob':
                                await FlutterPaymob.instance.payWithCard(
                                  title: Text("Card Payment"), // Optional - Custom title AppBar
                                  context: context,
                                  currency: "EGP",
                                  amount: 150,
                                  onPayment: (response) {
                                    if (response.success) {
                                      print("🎉 Payment Success! TxID: ${response.transactionID}");
                                    } else {
                                      print("❌ Payment Failed: ${response.message}");
                                    }
                                  },
                                );
                                break;
                              default:
                            }
                          }
                        }
                      },
                      child: Text("Complete Payment"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

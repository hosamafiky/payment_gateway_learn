part of '../../imports.dart';

class CreditCardSection extends StatefulWidget {
  const CreditCardSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<CreditCardSection> createState() => _CreditCardSectionState();
}

class _CreditCardSectionState extends State<CreditCardSection> {
  CreditCardModel cardModel = CreditCardModel('', '', '', '', false);
  void onCreditCardModelChange(CreditCardModel model) => setState(() => cardModel = model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardModel.cardNumber,
          expiryDate: cardModel.expiryDate,
          cardHolderName: cardModel.cardHolderName,
          cvvCode: cardModel.cvvCode,
          isHolderNameVisible: true,
          showBackView: cardModel.isCvvFocused,
          onCreditCardWidgetChange: (_) {},
        ),
        CreditCardForm(
          cardNumber: cardModel.cardNumber,
          expiryDate: cardModel.expiryDate,
          cardHolderName: cardModel.cardHolderName,
          cvvCode: cardModel.cvvCode,
          isCardHolderNameUpperCase: true,
          onCreditCardModelChange: onCreditCardModelChange,
          formKey: widget.formKey,
        ),
      ],
    );
  }
}

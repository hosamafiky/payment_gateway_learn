part of '../../imports.dart';

// ignore: must_be_immutable
class MyCreditCardModel extends CreditCardModel with EquatableMixin {
  MyCreditCardModel({String cardNumber = '', String expiryDate = '', String cardHolderName = '', String cvvCode = '', bool isCvvFocused = false})
    : super(cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused);

  factory MyCreditCardModel.empty() => MyCreditCardModel();
  factory MyCreditCardModel.fromCreditCardModel(CreditCardModel model) => MyCreditCardModel(
    cardNumber: model.cardNumber,
    expiryDate: model.expiryDate,
    cardHolderName: model.cardHolderName,
    cvvCode: model.cvvCode,
    isCvvFocused: model.isCvvFocused,
  );

  @override
  List<Object?> get props => [cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused];
}

class CreditCardSection extends StatefulWidget {
  const CreditCardSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<CreditCardSection> createState() => _CreditCardSectionState();
}

class _CreditCardSectionState extends State<CreditCardSection> {
  MyCreditCardModel cardModel = MyCreditCardModel();
  void onCreditCardModelChange(CreditCardModel model) {
    setState(() {
      cardModel = MyCreditCardModel.fromCreditCardModel(model);
    });
  }

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

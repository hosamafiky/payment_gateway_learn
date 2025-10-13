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
  const CreditCardSection({super.key});

  @override
  State<CreditCardSection> createState() => _CreditCardSectionState();
}

class _CreditCardSectionState extends State<CreditCardSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<MyCreditCardModel> cardNotifier = ValueNotifier(MyCreditCardModel());
  void onCreditCardModelChange(CreditCardModel model) {
    cardNotifier.value = MyCreditCardModel.fromCreditCardModel(model);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cardNotifier,
      builder: (context, model, child) {
        return Column(
          children: [
            CreditCardWidget(
              cardNumber: model.cardNumber,
              expiryDate: model.expiryDate,
              cardHolderName: model.cardHolderName,
              cvvCode: model.cvvCode,
              isHolderNameVisible: true,
              showBackView: model.isCvvFocused,
              onCreditCardWidgetChange: (_) {},
            ),
            CreditCardForm(
              cardNumber: model.cardNumber,
              expiryDate: model.expiryDate,
              cardHolderName: model.cardHolderName,
              cvvCode: model.cvvCode,
              isCardHolderNameUpperCase: true,
              onCreditCardModelChange: onCreditCardModelChange,
              formKey: formKey,
            ),
          ],
        );
      },
    );
  }
}

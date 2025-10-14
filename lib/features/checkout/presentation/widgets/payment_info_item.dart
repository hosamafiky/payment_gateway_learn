part of '../../imports.dart';

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem({super.key, required this.title, required this.value}) : _isTotal = false;
  const PaymentInfoItem.total({super.key, required this.title, required this.value}) : _isTotal = true;

  final String title, value;
  final bool _isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: _isTotal ? AppStyles.semibold24 : AppStyles.regular18),
          Text(value, style: _isTotal ? AppStyles.semibold24 : AppStyles.semibold18),
        ],
      ),
    );
  }
}

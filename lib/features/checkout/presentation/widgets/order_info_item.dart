part of '../../imports.dart';

class OrderInfoItem extends StatelessWidget {
  final TextStyle style;
  final String label;
  final num value;

  const OrderInfoItem({super.key, this.style = AppStyles.regular18, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text('\$${value.toStringAsFixed(2)}', style: style),
      ],
    );
  }
}

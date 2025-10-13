part of '../../imports.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key, this.isSelected = false, required this.imagePath});

  final bool isSelected;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: isSelected ? Color(0xff34a853) : Color(0xFF808080), width: isSelected ? 3 : 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [if (isSelected) BoxShadow(color: Color(0xff34a853).withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 4))],
      ),
      child: Center(child: Image.asset(imagePath, height: 40, fit: BoxFit.scaleDown)),
    );
  }
}

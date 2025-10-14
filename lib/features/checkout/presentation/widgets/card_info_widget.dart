part of '../../imports.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 23),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset('assets/images/master-card.png', width: 35),
          const SizedBox(width: 23),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Credit Card', style: AppStyles.regular18),
              Text('Mastercard **34', style: AppStyles.regular18.copyWith(fontSize: 16, color: Colors.black.withValues(alpha: 0.7))),
            ],
          ),
        ],
      ),
    );
  }
}

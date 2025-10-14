part of '../../imports.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.only(top: 65),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFFEDEDED),
      ),
      child: Column(
        children: [
          Text('Thank You!', style: AppStyles.medium25),
          const SizedBox(height: 2),
          Text('Your transaction was successful.', style: AppStyles.regular20.copyWith(color: Colors.black.withValues(alpha: 0.8))),
          const SizedBox(height: 42),
          Column(
            spacing: 20,
            children: [
              PaymentInfoItem(title: 'Date', value: '2024-10-01'),
              PaymentInfoItem(title: 'Time', value: '14:30'),
              PaymentInfoItem(title: 'to', value: 'John Doe'),
            ],
          ),
          Divider(height: 60, indent: 15, endIndent: 15, color: Color(0xFFC7C7C7)),
          PaymentInfoItem.total(title: 'Total', value: '\$50.97'),
          const SizedBox(height: 30),
          CardInfoWidget(),
        ],
      ),
    );
  }
}

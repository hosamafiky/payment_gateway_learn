part of '../../imports.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: EdgeInsets.all(20).copyWith(top: MediaQuery.viewPaddingOf(context).top + 20),
        child: Stack(
          children: [
            ThankYouCard(),
            Positioned(top: 0, left: 0, right: 0, child: CircleAvatar(radius: 50, backgroundColor: Color(0xFFD9D9D9))),
            Positioned(top: 0, left: 0, right: 0, child: Icon(Icons.check_circle, size: 100, color: Colors.green)),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.2,
              left: -17.5,
              child: CircleAvatar(backgroundColor: Colors.white, radius: 17.5),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.2,
              right: -17.5,
              child: CircleAvatar(backgroundColor: Colors.white, radius: 17.5),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.2 + 9,
              left: 0,
              right: 0,
              child: CustomPaint(
                painter: DashedLinePainter(color: Color(0xFFB8B8B8), dashWidth: 10, dashSpace: 5),
                child: Container(height: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

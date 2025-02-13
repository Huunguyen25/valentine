import 'package:flutter/material.dart';

//Foungnigue Souleymane Hassan Coulibaly
// Huu Nguyen

void main() => runApp(const HeartbeatApp());

class HeartbeatApp extends StatelessWidget {
  const HeartbeatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Heartbeat());
  }
}

class Heartbeat extends StatefulWidget {
  const Heartbeat({super.key});

  @override
  State<Heartbeat> createState() => _HeartbeatState();
}

// Animation scale class used from the flutter doc website documentation
class _HeartbeatState extends State<Heartbeat> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    // Animation of the curves to have a beating effect
    curve: Curves.bounceInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/images/Heart.png',
              height: 212.0,
              width: 212.0,
            ),
          ),
        ),
      ),
    );
  }
}

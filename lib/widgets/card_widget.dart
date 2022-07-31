import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(this.image, {Key? key}) : super(key: key);
  final String image;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000));
    _animation = Tween(
        begin: 0.1,
        end: 1.0
    ).animate(_controller);
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);
    return FadeTransition(
      opacity: _animation,
      child: SizedBox(
        width: 150,
        child: Image.asset(widget.image)),
    );
  }
}

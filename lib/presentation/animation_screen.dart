import 'package:flutter/material.dart';
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<Color?> _colourAnimation;
  late Animation<double> _borderRadiusAnimation;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    _widthAnimation = Tween<double>(begin: 50,end: 200).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _colourAnimation = ColorTween(begin: Colors.blue,end: Colors.green).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));
    _borderRadiusAnimation = Tween<double>(begin: 0.0,end: 50.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    
    _controller.forward();
  }
  
  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Users"),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.keyboard_arrow_left_outlined))),
      body: AnimatedBuilder(animation: _controller, builder: (context,child){
        return Center(child: Container(
          width: _widthAnimation.value,
          height: _widthAnimation.value,
          decoration: BoxDecoration(color: _colourAnimation.value,borderRadius: BorderRadius.circular(_borderRadiusAnimation.value)),
        ),);
      }),
    );
  }
}

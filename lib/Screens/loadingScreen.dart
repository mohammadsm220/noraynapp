import 'package:flutter/material.dart';
import 'package:noraynapp/Constant/constant.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
      
  AnimationController controller;
  Animation animation;

 
  @override
  void initState() {
    // Provider.of<Data>(context).NewsStream();
    // getNews();
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: kTimeOfShow),
      vsync: this,
    );
    animation = ColorTween(
      begin: Color(0xFF663e60),
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
//        print(animation.value);
        controller.value;
        if (controller.value == 1) {
          Navigator.popAndPushNamed(context, 'HomeScreen');
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Container(
          child: Center(
              child: Image.asset(
            'images/home.png',
            height: controller.value * kHeightAndWidthOfImage,
            width: controller.value * kHeightAndWidthOfImage,
          )),
        ),
      ),
    );
  }
}

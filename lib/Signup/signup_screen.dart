import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jobnest/services/glo_var.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );

    _animation.addListener(() {
      setState(() {});
    });
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        _animationController.forward();
      }
      _animationController.forward();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: signupImageUrl,
            placeholder: (context, url) => Image.asset(
              'assets/images/images/wallpaper.jpg',
              fit: BoxFit.fill,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
        ],
      ),
    );
  }
}

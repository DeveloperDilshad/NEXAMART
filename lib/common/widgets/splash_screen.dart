// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nexamart/constants/global_variables.dart';
import 'package:nexamart/features/auth/services/auth_service.dart';
import 'package:nexamart/provider/user_provider.dart';
import 'package:nexamart/common/widgets/bottom_bar.dart';
import 'package:nexamart/features/admin/screens/admin_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/home';
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      authService.getUserData(context).then((_) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        if (userProvider.user.token.isNotEmpty) {
          if (userProvider.user.type == 'user') {
            Navigator.of(context).pushReplacementNamed(BottomBar.routeName);
          } else {
            Navigator.of(context).pushReplacementNamed(AdminScreen.routeName);
          }
        } else {
          Navigator.of(context).pushReplacementNamed(BottomBar.routeName);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.secondaryColor,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset('assets/images/Logo.png'),
        ),
      ),
    );
  }
}

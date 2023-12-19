import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_proudects_app/config/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {context.go('/HomePage');
        // (config.get<SharedPreferences>().getString('title') == null)
        //     ? context.go('/LogIn')
        //     : context.go('/HomePage');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF9775FA),
      body: Center(
        child: Text(
          'Json Store',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

import 'package:amritha_ayurveda/common/helper/navigation_helper.dart';
import 'package:amritha_ayurveda/core/configs/app_images.dart';
import 'package:amritha_ayurveda/features/auth/login_in/view/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startSplashDelay();
  }

  Future<void> _startSplashDelay() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      NavigatorWidget.push(context: context, page: LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(AppImages.splashImage, fit: BoxFit.cover),
      ),
    );
  }
}

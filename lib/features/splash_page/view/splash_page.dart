import 'package:amritha_ayurveda/core/configs/app_images.dart';
import 'package:amritha_ayurveda/features/splash_page/controller/splash_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context, listen: false).initApp(context);
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

import 'package:amritha_ayurveda/core/theme/theme.dart';
import 'package:amritha_ayurveda/features/auth/login_in/controller/login_provider.dart';
import 'package:amritha_ayurveda/features/splash_page/view/splash_page.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amritha Ayurveda',
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}

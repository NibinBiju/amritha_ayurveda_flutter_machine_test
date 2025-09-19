import 'package:amritha_ayurveda/common/helper/navigation_helper.dart';
import 'package:amritha_ayurveda/core/services/secure_storage_service.dart';
import 'package:amritha_ayurveda/features/auth/login_in/view/login_page.dart';
import 'package:amritha_ayurveda/features/homepage/view/home_page.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();

  Future<void> initApp(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final _token = await _storageService.getUserToken();

    if (_token != null && _token.isNotEmpty) {
      NavigatorWidget.pushAndRemovePages(
        context: context,
        page: const HomePage(),
      );
    } else {
      NavigatorWidget.pushAndRemovePages(
        context: context,
        page: const LoginPage(),
      );
    }
  }
}

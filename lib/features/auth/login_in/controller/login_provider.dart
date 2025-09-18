import 'package:amritha_ayurveda/data/auth/model/login_model.dart';
import 'package:amritha_ayurveda/domain/auth/usecase/login_usecase.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoginSuccess = false;
  String? message;

  void onLogin({required LoginModel loginModel}) async {
    isLoading = true;
    notifyListeners();
    var returnedData = await sl<LoginUsecase>().call(params: loginModel);

    returnedData.fold(
      (error) {
        isLoading = false;
        isLoginSuccess = false;
        message = error;
        notifyListeners();
      },
      (success) {
        isLoading = false;
        isLoginSuccess = true;
        message = null;
        notifyListeners();
      },
    );
  }
}

import 'package:amritha_ayurveda/common/helper/custom_button.dart';
import 'package:amritha_ayurveda/common/helper/custom_textfield.dart';
import 'package:amritha_ayurveda/common/helper/navigation_helper.dart';
import 'package:amritha_ayurveda/core/configs/app_images.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
import 'package:amritha_ayurveda/core/configs/app_texts.dart';
import 'package:amritha_ayurveda/core/utils/app_validators.dart';
import 'package:amritha_ayurveda/data/auth/model/login_model.dart';
import 'package:amritha_ayurveda/features/auth/login_in/controller/login_provider.dart';
import 'package:amritha_ayurveda/features/homepage/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameEditingController =
      TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  void dispose() {
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            _handleLoginSnackbar(context, loginProvider);
            return Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.logInFrame),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(AppImages.appLogo, height: 120),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      _loginHeadText(text: AppTexts.loginHeadlineText),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 20,
                          children: [
                            Wrap(
                              spacing: 10,
                              children: [
                                _textfieldHeadtext(
                                  text: AppTexts.emailHeadlineText,
                                ),
                                SizedBox(height: 10),

                                CustomTextField(
                                  controller: _usernameEditingController,
                                  showBorder: false,
                                  labelText: AppTexts.emailHintText,
                                  validator: (value) =>
                                      Validators.validateUsername(value),
                                  inputType: TextInputType.emailAddress,
                                  autofillHints: [AutofillHints.email],
                                ),
                              ],
                            ),
                            Wrap(
                              spacing: 10,
                              children: [
                                _textfieldHeadtext(
                                  text: AppTexts.passwordHeadlineText,
                                ),
                                SizedBox(height: 10),
                                CustomTextField(
                                  isPassword: true,
                                  controller: _passwordEditingController,
                                  showBorder: false,
                                  labelText: AppTexts.passwordHintText,
                                  validator: (value) =>
                                      Validators.validatePassword(value),
                                  inputType: TextInputType.visiblePassword,
                                  autofillHints: [AutofillHints.password],
                                ),
                              ],
                            ),
                            SizedBox(height: 40),

                            //login button
                            loginProvider.isLoading == true
                                ? CustomButton(
                                    title: AppTexts.loadingText,
                                    onTap: () {},
                                  )
                                : CustomButton(
                                    title: AppTexts.loginText,
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        loginProvider.onLogin(
                                          loginModel: LoginModel(
                                            username: _usernameEditingController
                                                .text
                                                .trim(),
                                            password: _passwordEditingController
                                                .text
                                                .trim(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                            SizedBox(height: 70),
                            _buildPrivacyPolicyText(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _handleLoginSnackbar(BuildContext context, LoginProvider loginProvider) {
    if (loginProvider.message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(loginProvider.message!),
            backgroundColor: Colors.white,
          ),
        );
        loginProvider.message = null;
      });
    }

    // Snackbar on success
    if (loginProvider.isLoginSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(loginProvider.message ?? "Login Successful!"),
            backgroundColor: Colors.white,
          ),
        );
        loginProvider.isLoginSuccess = false;
        NavigatorWidget.push(context: context, page: HomePage());
      });
    }
  }

  Text _textfieldHeadtext({required String text}) {
    return Text(
      text,
      style: AppTextStyles.labelLarge,
      textAlign: TextAlign.left,
    );
  }

  Text _loginHeadText({required String text}) {
    return Text(text, style: AppTextStyles.heading2, textAlign: TextAlign.left);
  }

  Widget _buildPrivacyPolicyText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(
            text:
                "By creating or logging into an account you are agreeing with our ",
          ),
          TextSpan(
            text: "Terms and Conditions",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
          TextSpan(text: " and "),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
          TextSpan(text: "."),
        ],
      ),
    );
  }
}

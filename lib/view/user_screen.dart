import 'package:api_app/res/commen/app_elevated_button.dart';
import 'package:api_app/res/commen/app_textform_field.dart';
import 'package:api_app/res/commen/media_query.dart';
import 'package:api_app/res/constant/app_colors.dart';
import 'package:api_app/res/controller/user_controller.dart';
import 'package:api_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../res/commen/appText.dart';
import '../res/constant/app_string.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    super.key,
  });

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends StateMVC<UserScreen> {
  UserController userController = UserController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Utils utils = Utils();
  bool isSecurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(height(context) / 40),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AppText(
                  text: AppString.welcomeBack,
                ),
                AppTextFormField(
                  controller: emailController,
                  labelText: AppString.labelEmail,
                  hintText: AppString.hintEmailName,
                  keyboardType: TextInputType.emailAddress,
                  // validator: (value) =>
                  //     utils.isValidEmail(emailController.text)
                  //         ? null
                  //         : AppString.errorEmailTitle
                ),
                AppTextFormField(
                  controller: passwordController,
                  labelText: AppString.labelPassword,
                  hintText: AppString.hintTextPassword,
                  obscureText: isSecurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    icon: Icon(isSecurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isSecurePassword = !isSecurePassword;
                      });
                    },
                  ),
                  // validator: (value) =>
                  //     utils.isValidPassword(passwordController.text)
                  //         ? null
                  //         : AppString.errorPasswordTitle
                ),
                AppElevatedButton(
                  text: AppString.login,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      userController.callApi(
                          emailController.text, passwordController.text);
                    }
                  },
                ),
                AppText(
                    text: AppString.loginWith,
                    fontWeight: FontWeight.w100,
                    color: AppColors.darkGray,
                    size: height(context) / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: AppString.doNotHaveAccount,
                        fontWeight: FontWeight.w100,
                        size: height(context) / 50),
                    TextButton(
                      child: AppText(
                          text: AppString.registerNow,
                          color: AppColors.lightBlueColor,
                          fontWeight: FontWeight.bold,
                          size: height(context) / 50),
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

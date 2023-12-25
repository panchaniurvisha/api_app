import 'dart:js';

import 'package:api_app/api_services/repository.dart';
import 'package:api_app/model/login_user_model.dart';
import 'package:api_app/utils/utils.dart';
import 'package:api_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class UserController extends ControllerMVC {
  LoginUserModel? loginUserModel;
  Utils utils = Utils();
  //final ApiService _apiService = ApiService();
  Future<void> callApi(String email, String password) async {
    try {
      await postApiCall(email, password).then(
        (value) {
          if (value != null) {
            print("Value-->$value");
            setState(() {
              loginUserModel = value;
              Navigator.push(context as BuildContext,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            });
          } else {
            () {
              print("fdhfd");
            };
          }
        },
      );
    } catch (error) {
      utils.hideLoader();
      debugPrint("Error: $error");
    }
  }
}

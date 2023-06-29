import 'dart:convert';

import 'package:api_app/model/user_model.dart';
import 'package:api_app/res/constant/app_constant.dart';
import 'package:api_app/res/constant/app_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();
  List<UserModel> userModelList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appBarTitle),
        actions: [
          IconButton(
              onPressed: () => getUserData(), icon: const Icon(Icons.get_app))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () {},
          title: Text(userModelList[index].name ?? ""),
          subtitle: Text(userModelList[index].email ?? ""),
          leading: Text(userModelList[index].id.toString()),
        ),
        itemCount: userModelList.length,
        padding: const EdgeInsets.all(15),
      ),
    );
  }

  getUserData() async {
    Response response;
    //response = await dio.get('${AppConstant.baseUrl}/users?id=1');
    //debugPrint(response.data.toString());
    // The below request is the same as above.

    ///OR
    response = await dio.get(
      '${AppConstant.baseUrl}/users',
      // queryParameters: {'id': 1},
      //options: Options(headers: {
      // "x-api-key": "token",
      //"Authorization": " Bearar put token",
      // })
    );

    debugPrint(response.data.toString());
    userModelList = userModelFromJson(jsonEncode((response.data)));
    setState(() {});
    debugPrint("userModelList------->${userModelList[0].name}");
  }
}

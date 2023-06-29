import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../res/constant/app_constant.dart';
import '../res/constant/app_string.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final Dio dio = Dio();
  List<UserPhotos> userModelList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.title),
        actions: [
          IconButton(
              onPressed: () => getUserData(), icon: const Icon(Icons.get_app))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () {},
          title: Text(userModelList[index].title ?? ""),
          subtitle: Text(userModelList[index].url ?? ""),
          leading: Text(userModelList[index].id.toString()),
        ),
        itemCount: userModelList.length,
        padding: const EdgeInsets.all(15),
      ),
    );
  }

  getUserData() async {
    Response response;
    //response = await dio.get('${AppConstant.baseUrl}/users?id=1&id=2');//endpoint?parameter&second parameter&thirdparameter

    //debugPrint(response.data.toString());
    // The below request is the same as above.

    ///OR
    response = await dio.get(
      '${AppConstant.baseUrl}/photos',
      //queryParameters: {'id': 2},
      //options: Options(headers: {
      // "x-api-key": "token",
      //"Authorization": " Bearar putToken",
      // })
    );

    debugPrint(response.data.toString());
    userModelList = userPhotosFromJson(jsonEncode((response.data)));
    setState(() {});
    debugPrint("userModelList------->${userModelList[0].title}");
  }
}

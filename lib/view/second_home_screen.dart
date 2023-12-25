import 'dart:convert';

import 'package:api_app/res/constant/app_constant.dart';
import 'package:api_app/res/constant/app_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class SecondHomeScreen extends StatefulWidget {
  const SecondHomeScreen({super.key});

  @override
  State<SecondHomeScreen> createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  List<UserModelTwo> userModelList = [];
  UserModelThree? userModelThree;
  final Dio dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    getApi();
    //postApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppString.appBarTitle),
        ),
        body: Column(
          children: [
            Text("Page---${userModelThree!.page.toString() ?? ""}"),
            Text("Job------${userModelThree!.totalPages.toString() ?? ""}"),
          ],
        )

        // userModelList.isEmpty
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : ListView.builder(
        //         itemBuilder: (context, index) => ListTile(
        //           title: Text(userModelList[index].id.toString() ?? ""),
        //           subtitle: Text(userModelList[index].title ?? ""),
        //           leading: Text(userModelList[index].price.toString() ?? ""),
        //           trailing:
        //               Image.network(userModelList[index].image.toString() ?? ""),
        //         ),
        //         itemCount: userModelList.length,
        //         shrinkWrap: true,
        //         physics: const AlwaysScrollableScrollPhysics(),
        //       ),
        );
  }

  getApi() async {
    Response response;
    response = await dio.get(
      '${AppConstant.baseUrlOne}/products/category/jewelery',
    );
    if (response.statusCode == 200) {
      debugPrint("Status Code-->${response.statusCode}}");
      debugPrint(response.data.toString());
      userModelList = userModelTwoFromJson(jsonEncode((response.data)));
      setState(() {});
    } else if (response.statusCode == 500) {
      debugPrint("Server Not Connect");
    }
  }
}

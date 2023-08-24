import 'dart:convert';

import 'package:api_app/model/user_model.dart';
import 'package:api_app/res/constant/app_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../res/constant/app_constant.dart';

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
            icon: const Icon(Icons.more_vert),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(
                    const Duration(seconds: 3),
                    () {
                      Navigator.of(context).pop();
                    },
                  );
                  return AlertDialog(
                    buttonPadding: EdgeInsets.only(bottom: 60),
                    actions: [
                      IconButton(
                          onPressed: () => getUserData(),
                          icon: const Icon(Icons.get_app)),
                      IconButton(
                          onPressed: () => postApiCall(),
                          icon: const Icon(Icons.post_add)),
                    ],
                  );
                }),
          )
        ],
      ),
      body: userModelList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
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
    //response = await dio.get('${AppConstant.baseUrl}/users?id=1&id=2');//endpoint?parameter&second parameter&thirdparameter

    //debugPrint(response.data.toString());
    // The below request is the same as above.

    ///OR
    response = await dio.get(
      '${AppConstant.baseUrl}/users',
      //queryParameters: {'id': 2},
      //options: Options(headers: {
      // "x-api-key": "token",
      //"Authorization": " Bearar putToken",
      // })
    );
    if (response.statusCode == 200) {
      debugPrint("Status Code-->${response.statusCode}}");
      debugPrint(response.data.toString());
      userModelList = userModelFromJson(jsonEncode((response.data)));
      setState(() {});
      debugPrint("userModelList------->${userModelList[0].name}");
    } else if (response.statusCode == 500) {
      debugPrint("Server Not Connect");
    }
  }

 /* postApiCall() async {
    Response response;
    response=await dio
        .post(
      '${AppConstant.baseUrl}/posts',
     data: {"name": "urvisha", "email": "urvisha1104@gmail.com", "id": "1"}
    );

      debugPrint("Value ---> ${response.data.toString()}");
      if (response.statusCode == 200) {
        //userModelList = userModelFromJson(jsonEncode(value.data));
        //setState(() {});
      } else if (response.statusCode == 500) {
        debugPrint("Server Not Connect");
      }
    }
  }*/
  postApiCall() async {
    final FormData formData = FormData.fromMap(
        {"name": "urvisha", "email": "urvisha1104@gmail.com", "id": "1"});

    await dio
        .post(
      '${AppConstant.baseUrl}/posts',
      data: formData,
    )
        .then((value) {
      debugPrint("Value ---> $value");
      debugPrint("Value ---> ${value.data.toString()}");
      if (value.statusCode == 200) {
        debugPrint("Status Code --> ${value.statusCode}");
        //userModel = userModelFromJson(jsonEncode(value.data));
        //setState(() {});
      } else if (value.statusCode == 500) {
        debugPrint("Server Not Connect");
      }
    });
  }
/*import 'dart:convert';

import 'package:api_ten/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();

  List<UserModel>? userModel;

  @override
  void initState() {
    // TODO: implement initState
    getApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Call"),
      ),
      body: (userModel != null)
          ? ListView.separated(
              itemCount: userModel!.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  // putApiCall();
                  // postApiCall();
                  deleteApiCall();
                },
                leading: ClipOval(
                  child: Image.network(userModel![index].avatar!),
                ),
                tileColor: Colors.grey.shade300,
                title: Text(userModel![index].name!),
                subtitle: Text(userModel![index].address!),
                trailing: Text(userModel![index].id.toString()),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  getApiCall() async {
    await dio.get('https://644c9ed557f12a1d3dce10ab.mockapi.io/api/v1/user').then((value) {
      debugPrint("Value --> $value");
      if (value.statusCode == 200) {
        userModel = userModelFromJson(jsonEncode(value.data));
        setState(() {});
      } else if (value.statusCode == 500) {
        debugPrint("Server Not Connect");
      }
    });
  }

  putApiCall() async {
    final FormData formData = FormData.fromMap({
      "name": "Julius",
      "id": "1",
    });

    await dio
        .put(
      'https://644c9ed557f12a1d3dce10ab.mockapi.io/api/v1/user/1',
      data: formData,
    )
        .then((value) {
      debugPrint("Value --> $value");
      if (value.statusCode == 200) {
        // userModel = userModelFromJson(jsonEncode(value.data));
        setState(() {});
      } else if (value.statusCode == 500) {
        debugPrint("Server Not Connect");
      }
    });
  }

  postApiCall() async {
    final FormData formData = FormData.fromMap({
      "createdAt": "2023-04-28T08:40:51.913Z",
      "name": "Sonja Kulas",
      "avatar": "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/241.jpg",
      "address": "356",
      "company_name": "Funk, Collier and Hessel",
      "id": "22",
    });

    await dio
        .post(
      'https://644c9ed557f12a1d3dce10ab.mockapi.io/api/v1/user',
      data: formData,
    )
        .then((value) {
      debugPrint("Value --> $value");
      if (value.statusCode == 200) {
        // userModel = userModelFromJson(jsonEncode(value.data));
        setState(() {});
      } else if (value.statusCode == 500) {
        debugPrint("Server Not Connect");
      }
    });
  }

  deleteApiCall() async {
    await dio.delete('https://644c9ed557f12a1d3dce10ab.mockapi.io/api/v1/user/5').then((value) {
      debugPrint("Value --> $value");
      if (value.statusCode == 200) {
        // userModel = userModelFromJson(jsonEncode(value.data));
        setState(() {});
      } else if (value.statusCode == 500) {
        debugPrint("Server Not Connect");
      }
    });
  }
}*/
}

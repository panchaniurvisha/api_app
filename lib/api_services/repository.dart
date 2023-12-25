import 'package:api_app/res/constant/app_constant.dart';
import 'package:dio/dio.dart';

import '../model/login_user_model.dart';

final Dio dio = Dio();
// Future<Map<String, dynamic>> postApiCall(Map<String, dynamic> data) async {
//   try {
//     final Response response = await dio.post(
//       '${AppConstant.baseUrlTwo}/api/users',
//       data: FormData.fromMap(data),
//     );
//
//     if (response.statusCode == 200) {
//       print("success login");
//       return response.data;
//     } else if (response.statusCode == 500) {
//       throw Exception("Server Not Connect");
//     }
//   } on DioException catch (error) {
//     // Handle Dio-specific errors
//     print("DioError: $error");
//     throw Exception("Error: ${error.message}");
//   } catch (error) {
//     // Handle other errors
//     print("Error: $error");
//     throw Exception("Error: $error");
//   }
//   // If something goes wrong, you can return an empty map or handle it accordingly
//   return {};
// }
Future<LoginUserModel?> postApiCall(String email, String password) async {
  try {
    final Response response = await dio.post(
      '${AppConstant.baseUrlTwo}/api/users',
      data: {"email": email, "password": password},
      // options: Options(headers: {
      //   "Content-Type": "application/json", // Add headers if required
      // }),
    );
    print("data--->${response.data}");
    if (response.statusCode == 200) {
      print("Response status code: ${response.statusCode}");
      print("Response data: ${response.data}");
      LoginUserModel loginUserModel = LoginUserModel.fromJson(response.data);
      print("loginUserModel$loginUserModel");
      return loginUserModel;
    } else if (response.statusCode == 500) {
      throw Exception("Server Not Connect");
    }
  } on DioException catch (error) {
    print("DioError: $error");
    throw Exception("Error: ${error.message}");
  } catch (error) {
    print("Error: $error");
    throw Exception("Error: $error");
  }
  return null;
}

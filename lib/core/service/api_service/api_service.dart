import 'dart:convert';
import 'package:e_commerce_app/core/model/otp_response.dart';
import 'package:e_commerce_app/core/model/resend_otp_response.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../core/model/sign_up_response.dart';
import '../../model/login_response.dart';

class ApiService {

  Future<SuccessResponse> signUpApi({
    required String firstName,
    required String lastName,
    required String? email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("https://login-signup-apis.onrender.com/api/signup"),
        body: {
          "firstName": firstName.toString(),
          "lastName": lastName.toString(),
          "email": email,
          "password": password
        },
      );
      if (response.statusCode == 201) {
        print("response----${response.body}");
        return SuccessResponse.fromJson(jsonDecode(response.body));
      } else{
        Fluttertoast.showToast(
          msg: jsonDecode(response.body)["error"]["message"],
          toastLength: Toast.LENGTH_SHORT,
        );
        return SuccessResponse();
      }
    } catch (e) {
      print("Sign up api function catch error ${e}");
      //final errorMessage = e.response!.data['message'];
      throw Exception('An error occurred: $e');
    }
  }

  Future<LoginResponse> logInApi({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("https://login-signup-apis.onrender.com/api/login"),
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else{

        Fluttertoast.showToast(
          msg: jsonDecode(response.body)["error"]["message"],
          toastLength: Toast.LENGTH_SHORT,
        );
        return LoginResponse();
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<OtpResponse> otpApi({
    required String otp,
    required String email
  }) async {
    try {
      final response = await http.post(
        Uri.parse("https://login-signup-apis.onrender.com/api/verify"),
        body: {
          "email": email,
          "otp": otp,
        },
      );
      if (response.statusCode == 200) {
        return OtpResponse.fromJson(jsonDecode(response.body));
      } else{

        Fluttertoast.showToast(
          msg: jsonDecode(response.body)["error"]["message"],
          toastLength: Toast.LENGTH_SHORT,
        );
        return OtpResponse();
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<ResendOtpResponse> resendOtpApi() async {
    try {
      final response = await http.post(
        Uri.parse("https://login-signup-apis.onrender.com/api/resendOtp"),
        // body: {
        //   "email": email,
        //   "otp": otp,
        // },
      );
      if (response.statusCode == 200) {
        return ResendOtpResponse.fromJson(jsonDecode(response.body));
      } else{

        Fluttertoast.showToast(
          msg: jsonDecode(response.body)["error"]["message"],
          toastLength: Toast.LENGTH_SHORT,
        );
        return ResendOtpResponse();
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}

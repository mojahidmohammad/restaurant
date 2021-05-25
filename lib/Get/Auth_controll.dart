import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurant/Get/servieces/servieces.dart';
import 'Model/rest_Model.dart';

class AuthController extends GetxController {
  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
  var access_token = '';
  var get_restaurants = List<restaurants>().obs;
  var postloading = true.obs;

  Services services = Services();

  Future<bool> Login({phoneNumber, OTP}) async {
    final prefs = await SharedPreferences.getInstance();

    {
      final data = {
        'phone_number': phoneNumber.toString(),
        'otp': OTP.toString()
      };
      final response = await Dio().post(
        'https://long-rubber.herokuapp.com/api/v1/login/otp',
        options: Options(
          contentType: 'application/json',
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
          },
        ),
        data: json.encode(data),
      );
      if (response.statusCode == 200) {
        try {
          access_token = response.data['access_token'];
          print(access_token);
          prefs.setString('access_token', access_token);
        } catch (e) {
          print('HttpHelper => checkForChangePhoneNumber => ERROR = $e');
          return Future.error(e);
        }
      }
      return true;
    }
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallposts();
      print("reeeeeeeesuuuuult");
      print(result);

      if (result != null) {
        get_restaurants.assignAll(result);
      } else {
        print("nullfgvhj");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }

}

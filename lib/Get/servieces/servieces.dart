import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/Get/Auth_controll.dart';
import 'package:restaurant/Get/Model/rest_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

var controller = Get.put(AuthController());

class Services {
  Future<List<restaurants>> getallposts() async {
    final prefs = await SharedPreferences.getInstance();
    int conut = 0;
    try {
      List<restaurants> posts = List<restaurants>();

      var response = await Dio()
          .get(
        "https://long-rubber.herokuapp.com/api/v1/restaurants",
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': "Bearer ${prefs.getString('access_token')}",
            'Accept': '*/*',
            'Content-Type': 'application/json',
          },
        ),
      )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        print('20000000000000');
        var jsonresponse = (response.data);
        print(jsonresponse);
        var data = jsonresponse;

        print(data);
        for (var item in data) {
          print("ddddddddd");
          print(item);
          restaurants post = restaurants(
            status: item["status"].toString(),
            cuisine: item["cuisine"].toString(),
            prices: item["prices"].toString(),
            name: item["name"].toString(),
            id: item["id"],
            images: item["images"].cast<String>(),
            rate: item["rate"],
           // topComments: item["top_comments"],

            //  images: item[conut]["images"],
          );
          conut++;
          posts.add(post);
        }

        return posts;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}

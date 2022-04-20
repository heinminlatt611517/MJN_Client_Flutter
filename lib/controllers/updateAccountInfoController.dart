import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class UpdateAccountInfoController extends GetxController{

 late NetworkResult networkResult;
  var isLoading = false.obs;

  void updateAccountInfo( Map<String, String> params,String token,BuildContext context) async {
    try {
      isLoading(true);
      var res = await MjnAPI.updateAccountInfo(params,token);
      if (res != null) {
        networkResult = res;
        if (networkResult.status == 'Success'){

         Navigator.of(context).pop();
        }
        print(networkResult.status);
        print(networkResult.description);
      }
    } finally {
      isLoading(false);

    }
  }

}
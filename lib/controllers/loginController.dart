import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/NewLoginVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/TabView.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late NewLoginVo loginVo;
  var isLoading = false.obs;
  final loginDataStorage = GetStorage();

  void fetchLoginData(Map<String, String> map, BuildContext context) async {
    try {
      isLoading(true);

      var res = await MjnAPI.fetchLoginData(map);

      if (res != null) {
        loginVo = res;


        if (loginVo.status == 'Success') {

          String? fToken = await FirebaseMessaging.instance.getToken();

          print('FToken :'+fToken.toString());

          Map<String, String> map = {
            'tenant_id': loginVo.tenantId.toString(),
            'firebase_token': fToken.toString(),
            'app_version': app_version,
          };

          MjnAPI.saveFirebaseToken(map,loginVo.token.toString());

          loginDataStorage.write(PHONE_NO, loginVo.phone);
          loginDataStorage.write(UID, loginVo.uid);
          loginDataStorage.write(BUILDING, loginVo.building);
          loginDataStorage.write(UNIT, loginVo.unit);
          loginDataStorage.write(TOKEN, loginVo.token);
          loginDataStorage.write(DATA_TENANT_ID, loginVo.tenantId);
          loginDataStorage.write(USER_NAME, loginVo.userName);
          loginDataStorage.write(EMAIL, loginVo.email);

          Navigator.of(context).pushReplacementNamed(TabScreens.routeName);
        }
        else if(loginVo.status == 'Fail' && loginVo.responseCode == '003'){

          AppUtils.showErrorSnackBar('Fail', 'Building or Unit is incorrect');

        }

        print(loginVo.status);
        print(loginVo.description);
        print(loginVo.uid);
        print(loginVo.building);
      }


    } finally {
      isLoading(false);
    }
  }
}

import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/models/accountInfoVO.dart';
import 'package:MJN/models/serviceRequestTypeVO.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class CheckRequireUpdateController extends GetxController{

  NetworkResult? networkResult;

  Future<void> checkRequireUpdate(BuildContext context) async {
    try {

      var res = await MjnAPI.checkRequireUpdate();
      if (res != null) {
        networkResult = res;
        print('Require update'+networkResult!.isRequieredUpdate.toString());
      }
      else {
        networkResult = null;
      }
    } catch(e) {

    }
  }

}

import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/accountInfoVO.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class AccountDetailController extends GetxController{

    AccountInfoVo? accountInfoVo ;
  var isLoading = true.obs;

  Future<void> fetchAccountInfoData(String token,String uid,String tenantID,BuildContext context) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(tenantID);

      var res = await MjnAPI.fetchAccountInfoData(token,uid,tenantID);

      if (res != null) {
        if(res.status == 'Fail'){
            AppUtils.showSessionExpireDialog('Session is expired', 'Please login again',context);
        }
        else{
          accountInfoVo = res;
          print(accountInfoVo!.status);
          isLoading (false);
        }

      }
      else {
        isLoading(false);
        accountInfoVo = null;
      }

    } catch(e) {
      isLoading(false);
    }
  }

}

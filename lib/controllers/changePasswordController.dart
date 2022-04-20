import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/views/TabView.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  late NetworkResult networkResult;
  var isLoading = false.obs;
  void changePassword( Map<String, String> params,String token) async {
    try {
      isLoading(true);
      var res = await MjnAPI.changePassword(params,token);
      if (res != null) {
        networkResult = res;
        if (networkResult.status == 'Success'){
          //Get.to(TabScreens());
        }
        print(networkResult.status);
        print(networkResult.description);
      }
    } finally {
      isLoading(false);
    }
  }
}
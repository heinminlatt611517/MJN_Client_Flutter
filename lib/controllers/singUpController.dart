import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/views/LoginView.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
 late NetworkResult networkResult;
  var isLoading = false.obs;
  void signUp( Map<String, String> params) async {
    try {
      isLoading(true);
      var res = await MjnAPI.signUp(params);
      if (res != null) {
        networkResult = res;
        if (networkResult.status == 'Success'){
          Get.to(LoginView());
        }
        print(networkResult.status);
        print(networkResult.description);
      }
    } finally {
      isLoading(false);
    }
  }
}
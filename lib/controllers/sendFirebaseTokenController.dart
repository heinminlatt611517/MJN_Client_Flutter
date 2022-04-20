import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:get/state_manager.dart';

class SendFirebaseTokenController extends GetxController{
 late NetworkResult networkResult;
  var isLoading = true.obs;
  void sendFirebaseTokenToServer( Map<String, String> params) async {
    try {
      isLoading(true);

      var res = await MjnAPI.sendFirebaseTokenToSever(params);

      if (res != null) {
        networkResult = res;
        print(networkResult.status);
        print(networkResult.description);
      }
    } finally {
      isLoading(false);
    }
  }

}
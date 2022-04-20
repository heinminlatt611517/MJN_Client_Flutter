import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/billingResponseNumberVO.dart';
import 'package:get/state_manager.dart';

class BillingResponseController extends GetxController{

   BillingResponseNumberVo? billingResponseNumberVo;
  var isLoading = false.obs;

 Future<void>  fetchBillingResponseNumber(String token,String tenantID) async {
    try {
      isLoading(true);
      print(token);


      var res = await MjnAPI.fetchBillingResponseNumber(token,tenantID);


      if (res != null) {
        isLoading(false);
        billingResponseNumberVo = res;
        print(billingResponseNumberVo!.status);
        print(billingResponseNumberVo!.billingResponsiveNo);
      }
    } finally {
      //isLoading(false);
    }
  }

}
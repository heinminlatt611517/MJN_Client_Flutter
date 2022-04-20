import 'package:MJN/Network/MjnAPI.dart';

import 'package:MJN/models/getPaymentMethodsVO.dart';

import 'package:get/state_manager.dart';

class GetPaymentMethodController extends GetxController{

   GetPaymentMethodsVo? getPaymentMethodsVo;
  var isLoading = false.obs;

 Future<void>  fetchPaymentMethod(String token,String tenantID,String invoiceID) async {
    try {
      //isLoading(true);
      print(token);


      var res = await MjnAPI.fetchPaymentMethods(token,tenantID,invoiceID);


      if (res != null) {
        isLoading(false);
        getPaymentMethodsVo = res;
        print(getPaymentMethodsVo!.status);
        print(getPaymentMethodsVo!.details.paymentLink);
      }
    } finally {
      //isLoading(false);
    }
  }

}
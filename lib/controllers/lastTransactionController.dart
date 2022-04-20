import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/transactionVO.dart';
import 'package:get/state_manager.dart';

class LastTransactionController extends GetxController{

   TransactionVo? transactionVo;
  var isLoading = true.obs;

  void fetchLastTransactionData(String token,String uid,String tenantID) async {
    try {
      isLoading(true);

      var res = await MjnAPI.fetchLastTransactionData(token,uid,tenantID);

      if (res != null) {
        transactionVo = res;
        print(transactionVo!.details!.paymentTotal);
        isLoading(false);
      }
      else {
        transactionVo = null;
      }
    } catch(e) {
      isLoading(false);
    }
  }

}
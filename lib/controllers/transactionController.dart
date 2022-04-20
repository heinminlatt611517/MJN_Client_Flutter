import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/transactionVO.dart';
import 'package:get/state_manager.dart';

class TransactionController extends GetxController{

 late TransactionVo transactionVo;
  var isLoading = true.obs;

  void fetchTransactionDataByID(String token,String uid,String transactionID) async {
    try {
      isLoading(true);

      var res = await MjnAPI.fetchTransactionData(token,uid,transactionID);

      if (res != null) {
        transactionVo = res;
        print(transactionVo.details!.paymentTotal);
      }
    } finally {
      isLoading(false);
    }
  }

}
import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/transactionListVO.dart';
import 'package:get/state_manager.dart';

class TransactionListController extends GetxController{

 late TransactionListVo transactionListVo;
  var isLoading = true.obs;

  void fetchTransactionList(String token,String uid,String tenantID) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(tenantID);

      var res = await MjnAPI.fetchTransactionList(token,uid,tenantID);


      if (res != null) {
        transactionListVo = res;
        print(transactionListVo.status);
      }
    } finally {
      isLoading(false);
    }
  }

}
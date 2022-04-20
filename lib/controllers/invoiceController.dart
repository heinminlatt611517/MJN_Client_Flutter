import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/invoiceVO.dart';
import 'package:get/state_manager.dart';

class InvoiceController extends GetxController{
  late InvoiceVo invoiceVo;
  var isLoading = true.obs;

  void fetchInvoiceDataByID(String token,String uid,String invoiceID,String tenantID) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(invoiceID);

      var res = await MjnAPI.fetchInvoiceDetailByID(token,uid,invoiceID,tenantID);


      if (res != null) {
        invoiceVo = res;
        print(invoiceVo.status);
      }
    } finally {
      isLoading(false);
    }
  }
}
import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/invoiceListVO.dart';
import 'package:MJN/models/transactionVO.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';


class InvoiceListController extends GetxController{
 late InvoiceListVo invoiceListVo;

  var isLoading = true.obs;

  void fetchPaymentInvoiceList(String token,String uid,String tenantID,BuildContext context) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(tenantID);

      var res = await MjnAPI.fetchPaymentInvoiceList(token,uid,tenantID);


      if (res != null) {
        invoiceListVo = res;
        print(invoiceListVo.status);
        isLoading (false);

        if(invoiceListVo.status == 'Fail'){
          AppUtils.showSessionExpireDialog('Session is expired', 'Please login again',context);
        }
      }

    } finally {
     // isLoading(false);
    }
  }

}
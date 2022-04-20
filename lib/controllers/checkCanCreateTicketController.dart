import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/billingResponseNumberVO.dart';
import 'package:MJN/models/checkCanCreateTicketVO.dart';
import 'package:MJN/models/ticketVO.dart';
import 'package:get/state_manager.dart';

class CheckCreateTicketController extends GetxController{

 late CheckCanCreateTicketVo checkCanCreateTicketVo;
  var isLoading = false.obs;

 Future<void>  checkCanCreateTicket(String token,String tenantID) async {
    try {
      isLoading(true);
      print(token);


      var res = await MjnAPI.checkCanCreateTicket(token,tenantID);


      if (res != null) {
        isLoading(false);
        checkCanCreateTicketVo = res;
        print(checkCanCreateTicketVo.status);
        print(checkCanCreateTicketVo.canCreate);
      }
    } finally {
      //isLoading(false);
    }
  }

}
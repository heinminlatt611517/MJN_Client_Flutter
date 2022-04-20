import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/ticketVO.dart';
import 'package:get/state_manager.dart';

class TicketByIdController extends GetxController{

 late TicketVo ticketVo;
  var isLoading = true.obs;

  void fetchTicketByTicketID(String token,String uid,String ticketID) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(ticketID);

      var res = await MjnAPI.fetchTicketByTicketID(token,uid,ticketID);


      if (res != null) {
        ticketVo = res;
        print(ticketVo.status);
      }
    } finally {
      isLoading(false);
    }
  }

}
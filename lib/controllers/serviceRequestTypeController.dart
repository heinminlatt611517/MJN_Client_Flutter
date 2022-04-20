import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/accountInfoVO.dart';
import 'package:MJN/models/serviceRequestTypeVO.dart';
import 'package:get/state_manager.dart';

class ServiceRequestTypeController extends GetxController{

  late ServiceRequestTypeVo serviceRequestTypeVo;
  var isLoading = true.obs;

  void fetchServiceRequestType() async {
    try {
      isLoading(true);


      var res = await MjnAPI.fetchServiceRequestType();


      if (res != null) {
        serviceRequestTypeVo = res;
        print(serviceRequestTypeVo.status);
      }
    } finally {
      isLoading(false);
    }
  }

}

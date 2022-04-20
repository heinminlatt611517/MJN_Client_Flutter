import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  PromotionAndOfferVo? promotionAndOfferVo;
  var isLoading = true.obs;
  final dataStorage = GetStorage();

  void fetchPromotionAndOfferData(BuildContext context) async {
    try {
      isLoading(true);

      var res = await MjnAPI.fetchPromotionAndOfferData();

      if (res != null) {
        promotionAndOfferVo = res;
        print(promotionAndOfferVo!.status);
        if (promotionAndOfferVo!.status == 'Success') {
          dataStorage.write(LOGIN_MANUAL, promotionAndOfferVo!.loginManual);
          dataStorage.write(
              SERVICE_TICKET_MANUAL, promotionAndOfferVo!.serviceTicketManual);
          dataStorage.write(
              ONLINE_PAYMENT_MANUAL, promotionAndOfferVo!.onlinePaymentManual);
        }

        isLoading(false);
      } else {
        isLoading(false);
        promotionAndOfferVo = null;
      }
    } catch (e) {
      isLoading(false);
    }
  }
}

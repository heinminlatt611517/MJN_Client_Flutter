import 'dart:convert';
import 'package:MJN/Network/Request/RequestCreateTicket.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/models/NewLoginVO.dart';
import 'package:MJN/models/accountInfoVO.dart';
import 'package:MJN/models/billingResponseNumberVO.dart';
import 'package:MJN/models/checkCanCreateTicketVO.dart';
import 'package:MJN/models/getPaymentMethodsVO.dart';
import 'package:MJN/models/invoiceListVO.dart';
import 'package:MJN/models/invoiceVO.dart';
import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/models/serviceRequestTypeVO.dart';
import 'package:MJN/models/ticketListVO.dart';
import 'package:MJN/models/ticketVO.dart';
import 'package:MJN/models/transactionListVO.dart';
import 'package:MJN/models/transactionVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:http/http.dart' as http;


class MjnAPI {
  static final String securityKey = 'moJoENEt2021sECuriTYkEy';
  static var client = http.Client();

  static Future<NewLoginVo?> fetchLoginData(
      Map<String, String> params) async {
    var response = await client.post(
      Uri.parse(LOGIN_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        "security_key": securityKey
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var login = newLoginVoFromJson(json);
      return login;
    } else {
      return null;
    }
  }

  static Future<NetworkResult?> sendFirebaseTokenToSever(
      Map<String, String> params) async {
    var response = await client.post(
      Uri.parse(FIREBASE_TOKEN_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var login = networkResultFromJson(json);
      return login;
    } else {
      return null;
    }
  }

  static Future<AccountInfoVo?> fetchAccountInfoData(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      Uri.parse(GET_ACCOUNT_INFO_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID)
      ,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var accountInfoData = accountInfoVoFromJson(json);
      return accountInfoData;
    } else {
      return null;
    }
  }


  static Future<InvoiceListVo?> fetchPaymentInvoiceList(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      Uri.parse(GET_INVOICE_LIST_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID)
      ,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var invoiceList = invoiceListVoFromJson(json);
      return invoiceList;
    } else {
      return null;
    }
  }


  static Future<TransactionListVo?> fetchTransactionList(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      Uri.parse(GET_TRANSACTION_LIST_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID)
      ,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var transactionList = transactionListVoFromJson(json);
      return transactionList;
    } else {
      return null;
    }
  }


  static Future<TicketListVo?> fetchTicketList(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      Uri.parse( GET_TICKET_LIST_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID)
     ,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      print(response.body);
      var ticketList = ticketListVoFromJson(json);
      return ticketList;
    } else {
      return null;
    }
  }

  static Future<TicketVo?> fetchTicketByTicketID(
      String token, String uid, String ticketID) async {
    var response = await client.get(
      Uri.parse(GET_TICKET_URL +
          UID + uid +
          APP_VERSION + app_version +
          TICKET_ID + ticketID),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      if(json.isNotEmpty){
        var ticket = ticketVoFromJson(json);
        return ticket;
      }

    } else {
      return null;
    }
  }

  static Future createTicket(
      RequestCreateTicket requestCreateTicket,String token) async {

    var bodyValue = requestCreateTicket.toJson();
    var bodyData = json.encode(bodyValue);
    var response = await client.post(
      Uri.parse(CREATE_TICKET_URL) ,
      body: bodyData,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = networkResultFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future signUp(
      Map<String, String> params) async {

    var response = await client.post(
      Uri.parse(SIGN_UP_URL) ,
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = networkResultFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future changePassword(
      Map<String, String> params,String token) async {

    var response = await client.put(
      Uri.parse(CHANGE_PASSWORD_URL) ,
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = networkResultFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future updateAccountInfo(
      Map<String, String> params,String token) async {

    var response = await client.put(
      Uri.parse(UPDATE_ACCOUNT_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = networkResultFromJson(json);
      return result;
    } else {
      return null;
    }
  }


  static Future fetchInvoiceDetailByID(
      String token, String uid, String invoiceID,String tenantID) async {

    var response = await client.get(
      Uri.parse(GET_INVOICE_URL +
          UID + uid +
          APP_VERSION + app_version +
          INVOICE_ID + invoiceID +
          TENANT_ID + tenantID)
      ,

      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = invoiceVoFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future fetchTransactionData(
      String token, String uid, String transactionID) async {

    var response = await client.get(

      Uri.parse( GET_TRANSACTION_URL +
          UID + uid +
          APP_VERSION + app_version +
          TRANSACTION_ID + transactionID),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = transactionVoFromJson(json);
      return result;
    } else {
      return null;
    }
  }


  static Future fetchLastTransactionData(
      String token, String uid, String tenantID) async {

    var response = await client.get(

      Uri.parse( GET_LAST_TRANSACTION_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = transactionVoFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future fetchServiceRequestType(
      ) async {

    var response = await client.get(

      Uri.parse( GET_SERVICE_REQUEST_TYPE_URL
          ),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = serviceRequestTypeVoFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future fetchPromotionAndOfferData(
      ) async {

    var response = await client.get(

      Uri.parse( GET_SLIDE_URL +
          APP_VERSION + app_version ),
      headers: {
        'content-type': 'application/json',
      },
    ).timeout(Duration(seconds: 10),onTimeout:(){
      return http.Response('Connection Time Out',500);
    });
    if (response.statusCode == 200) {
      var json = response.body;

      var result = promotionAndOfferVoFromJson(json);
      return result;
    }
    else if(response.statusCode == 500){
      return null;
    }
    else {
      return null;
    }
  }


  static Future fetchBillingResponseNumber(
      String token, String tenantID) async {

    var response = await client.get(

      Uri.parse( GET_BILLING_RESPONSE_URL +
          TENANT_ID + tenantID + APP_VERSION + app_version),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = billingResponseNumberVoFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future fetchPaymentMethods(
      String token, String tenantID,String invoiceID) async {

    var response = await client.get(

      Uri.parse( GET_PAYMENT_METHOD_URL +
          TENANT_ID + tenantID + APP_VERSION + app_version
          + INVOICE_ID + invoiceID
      ),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = getPaymentMethodsVoFromJson(json);
      return result;
    } else {
      return null;
    }
  }


  static Future checkCanCreateTicket(
      String token, String tenantID) async {

    var response = await client.get(

      Uri.parse( CHECK_CAN_CREATE_TICKET_URL +
          TENANT_ID + tenantID
      ),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = checkCanCreateTicketVoFromJson(json);
      return result;
    } else {
      return null;
    }
  }

  static Future saveFirebaseToken(
      Map<String, String> params,String token) async {
    var response = await client.post(
      Uri.parse(SAVE_FIREBASE_TOKEN_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var resp = networkResultFromJson(json);
      print('Save firebase token '+resp.status);
    } else {
      return null;
    }
  }

  static Future checkRequireUpdate() async {

    var response = await client.get(

      Uri.parse( CHECK_REQUIRE_UPDATE_URL +
           APP_VERSION + app_version
      ),

    ).timeout(const Duration(seconds: 7));
    if (response.statusCode == 200) {
      var json = response.body;
      var result = networkResultFromJson(json);
      return result;
    } else {
      return null;
    }
  }


}

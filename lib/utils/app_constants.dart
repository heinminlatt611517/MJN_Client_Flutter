const app_version = '1.0';

// staging url
const BASE_URL = 'http://mojoenet.myanmaronlinecreations.com/';

// live url
//const BASE_URL = 'https://mojoenet.com/';


const UID = 'uid=';
const APP_VERSION = '&app_version=';
const TENANT_ID = '&tenant_id=';
const TICKET_ID = '&ticket_id=';
const INVOICE_ID = '&inv_id=';
const TRANSACTION_ID = '&trxn_id=';

//get storage key
const USER_NAME = 'user_name';
const EMAIL = 'email';
const TOKEN = 'token';
const DATA_TENANT_ID = 'tenant_id';
const UNIT = 'unit';
const BUILDING = 'building';
const DATA_INVOICE_ID = 'invoiceID';
const LANGUAGE = 'language';
const PHONE_NO = 'phone_no';
const LOGIN_MANUAL = 'login_manual';
const SERVICE_TICKET_MANUAL = 'service_ticket_manual';
const ONLINE_PAYMENT_MANUAL = 'online_payment_manual';


const API_URL = BASE_URL+'api/';
const LOGIN_URL = API_URL+"login";
const FIREBASE_TOKEN_URL = API_URL+"send_firebase_token";
const SIGN_UP_URL = API_URL+"sign_up";
const GET_SLIDE_URL = API_URL+"get_slides?";
const CHANGE_PASSWORD_URL = API_URL+"change_password";
const UPDATE_ACCOUNT_URL = API_URL+"update_account_info";
const GET_ACCOUNT_INFO_URL = API_URL+"get_account_info?";
const CREATE_TICKET_URL = API_URL+"create_ticket";
const GET_TRANSACTION_LIST_URL = API_URL+"get_transaction_lists?";
const GET_INVOICE_LIST_URL = API_URL+"get_invoice_lists?";
const GET_TICKET_LIST_URL = API_URL+"get_ticket_lists?";
const GET_TICKET_URL = API_URL+"get_ticket?";
const GET_INVOICE_URL = API_URL+"get_invoice?";
const GET_TRANSACTION_URL = API_URL+"get_transaction?";
const GET_LAST_TRANSACTION_URL = API_URL+"get_last_transaction?";
const GET_BILLING_RESPONSE_URL = API_URL+"get_billing_responsive_number?";
const GET_SERVICE_REQUEST_TYPE_URL = API_URL+"get_service_req_type";
const GET_PAYMENT_METHOD_URL = API_URL+"get_payment_methods?";
const CHECK_CAN_CREATE_TICKET_URL = API_URL+"check_can_create_ticket?";
const SAVE_FIREBASE_TOKEN_URL = API_URL+"save_firebase_token?";
const CHECK_REQUIRE_UPDATE_URL = API_URL+"is_required_update?";



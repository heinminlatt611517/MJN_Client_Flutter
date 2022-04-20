import 'package:get/get.dart';
class LocalString extends Translations{
  @override

  Map<String, Map<String, String>> get keys => {


    'en_US':{
      //Login screen
      'login':'Login',
      'forgetPassword':'Forget Password ?',
      'signUp':'Sign Up',


      //Home Screen
      'currentSubscription' : 'Current Subscription',
    },

    //myanmar LANGUAGE
    'my_MM':{
      //Login screen
      'login':'ဝင်​ရောက်ရန်',
      'forgetPassword':'လှို့ဝှက်နံပတ်​မေ့​နေပါသလား ?',
      'signUp':'စာရင်းသွင်းရန်',

      //Home Screen
      'currentSubscription' : 'လက်ရှိ အသင်းဝင်​ကြေး',
    },
  };

}
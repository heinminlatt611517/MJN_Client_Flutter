import 'package:MJN/controllers/updateAccountInfoController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class EditAccountInfoDialog extends StatefulWidget {
  @override
  _EditAccountInfoDialogState createState() => _EditAccountInfoDialogState();
}

class _EditAccountInfoDialogState extends State<EditAccountInfoDialog> {
  var firstNameTxt = TextEditingController();
  var phoneNoTxt = TextEditingController();
  var emailTxt = TextEditingController();

  final loginDataStorage = GetStorage();

  final UpdateAccountInfoController updateAccountInfoController =
  Get.put(UpdateAccountInfoController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(
            12.0) //                 <--- border radius here
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('FirstName'),
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.only(bottom: 6),
                        margin: EdgeInsets.only( left: 47),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  12.0) //                 <--- border radius here
                              ),
                        ),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: firstNameTxt,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Phone Number'),
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.only(bottom: 6),
                        margin: EdgeInsets.only( left: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  12.0) //                 <--- border radius here
                              ),
                        ),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: phoneNoTxt,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Email'),
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.only(bottom: 6),
                        margin: EdgeInsets.only( left: 80),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  12.0) //                 <--- border radius here
                              ),
                        ),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: emailTxt,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: Obx(() {
                    if(updateAccountInfoController.isLoading.value){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else{
                      return
                        NeumorphicButton(
                          onPressed: () {
                            Map<String, String> map = {
                              'uid': loginDataStorage.read(UID),
                              'app_version': app_version,
                              'first_name': firstNameTxt.value.text,
                              'phone_1': phoneNoTxt.value.text,
                              'email': emailTxt.value.text,
                            };
                            updateAccountInfoController.updateAccountInfo(map, loginDataStorage.read(TOKEN),context);

                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape:
                            NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
                            color: Colors.amber,
                            depth: 8,
//                lightSource: LightSource.topLeft,
                          ),
                        );
                    }
                  }
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

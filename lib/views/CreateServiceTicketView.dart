import 'package:MJN/Network/Request/RequestCreateTicket.dart';
import 'package:MJN/controllers/createTicketController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CreateServiceTicketView extends StatefulWidget {
  static const routeName = '/create_service_ticket';

  @override
  _CreateServiceTicketViewState createState() =>
      _CreateServiceTicketViewState();
}

class _CreateServiceTicketViewState extends State<CreateServiceTicketView> {
  var buildingText = TextEditingController();
  var unitText = TextEditingController();
  var emailText = TextEditingController();
  var phoneNoText = TextEditingController();
  var nameText = TextEditingController();
  var messageText = TextEditingController();

  var selectServiceRequestIndex;
  var selectIssueIndex ;

  final CreateTicketController createTicketController =
      Get.put(CreateTicketController());

  int changePageIndex = 0;
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    nameText.text = loginDataStorage.read(USER_NAME);
    buildingText.text =loginDataStorage.read(BUILDING);
    unitText.text =  loginDataStorage.read(UNIT);
    phoneNoText.text = loginDataStorage.read(PHONE_NO);

    return changePageIndex == 1
        ? ServiceComplainView()
        : Scaffold(
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  changePageIndex = 1;
                                });
                              },
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.keyboard_backspace_sharp,
                                    size: 40,
                                  ))),
                          Row(
                            children: [
                              Container(
                                width: 150,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Name',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Building',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Unit',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Email',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Phone Number',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Type of Service Request',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Issue',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ]),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: nameText,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: buildingText,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: unitText,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: emailText,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: phoneNoText,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height,
                                        maxWidth:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.concave,
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(12)),
                                          depth: -4,
                                          lightSource: LightSource.topLeft,
//                    color: Colors.grey
                                        ),
                                        child: DropdownButtonFormField<int>(
                                          onChanged: (value) {
                                            selectServiceRequestIndex = value;
                                          },
                                          items: [1, 2, 3, 4, 5]
                                              .map((label) => DropdownMenuItem(
                                                    child:
                                                        Text(label.toString()),
                                                    value: label,
                                                  ))
                                              .toList(),
                                          hint: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              '-Select Service Request-',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height,
                                        maxWidth:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.concave,
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(12)),
                                          depth: -4,
                                          lightSource: LightSource.topLeft,
//                    color: Colors.grey
                                        ),
                                        child: DropdownButtonFormField<int>(
                                          onChanged: (value) {
                                            selectIssueIndex = value;
                                          },
                                          items: [1, 2, 3, 4, 5]
                                              .map((label) => DropdownMenuItem(
                                                    child:
                                                        Text(label.toString()),
                                                    value: label,
                                                  ))
                                              .toList(),
                                          hint: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              '-Select Topic-',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Message',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.only(left: 4, top: 4, right: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            child: TextField(
                              controller: messageText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 200,
                            child:

                               // ignore: missing_return
                               Obx((){
                                 if (createTicketController.isLoading.value) {
                                   return Center(
                                     child: CircularProgressIndicator(),
                                   );
                                 }

                                 else {
                                   return
                                     NeumorphicButton(
                                       onPressed: () {
                                         if (buildingText.text == '' ||
                                             unitText.text == '' ||
                                             emailText.text == '' ||
                                             phoneNoText.text == '' ||
                                             nameText.text == '' ||
                                             messageText.text == '' ||
                                             selectServiceRequestIndex == null ||
                                             selectIssueIndex == null
                                         ) {
                                           AppUtils.showErrorSnackBar(
                                               'Error!!', 'Data must not empty!!');
                                         }

                                         else {
                                           RequestCreateTicket requestCreateTicket =
                                           new RequestCreateTicket(
                                               loginDataStorage.read(USER_NAME),
                                               loginDataStorage.read(BUILDING),
                                               loginDataStorage.read(UNIT),
                                               emailText.value.text,
                                               loginDataStorage.read(PHONE_NO),
                                               selectServiceRequestIndex.toString(),
                                               selectIssueIndex.toString(),
                                               "Topic Other",
                                               messageText.value.text,
                                               messageText.value.text,
                                               loginDataStorage.read(DATA_TENANT_ID),
                                               loginDataStorage.read(UID),
                                               app_version);

                                           createTicketController.createTicket(
                                               requestCreateTicket,
                                               loginDataStorage.read(TOKEN),context);

                                         }
                                       },
                                       child: Center(
                                         child: Padding(
                                           padding:
                                           const EdgeInsets.only(top: 8, bottom: 8),
                                           child: Text(
                                             "Submit",
                                             style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 16,
                                                 color: Colors.white),
                                           ),
                                         ),
                                       ),
                                       style: NeumorphicStyle(
                                         shape: NeumorphicShape.flat,
                                         boxShape: NeumorphicBoxShape.roundRect(
                                             BorderRadius.circular(18)),
                                         color: Colors.amber,
                                         depth: 0,
//                lightSource: LightSource.topLeft,
                                       ),
                                     );
                                 }
                               })
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          );
  }
}

import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/InvoiceDetailView.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class SelectPaymentView extends StatefulWidget {

 final String invoiceID;
  SelectPaymentView(this.invoiceID);

  @override
  _SelectPaymentViewState createState() => _SelectPaymentViewState();
}

class _SelectPaymentViewState extends State<SelectPaymentView> {

  int changePageIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  changePageIndex == 1 ? InvoiceDetailView(widget.invoiceID) :SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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

            SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child:
               Column(
                  children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                         height: 40,
                         color: Colors.lightBlue,
                         alignment: Alignment.centerLeft,
                         child: Padding(
                           padding: const EdgeInsets.only(left: 4),
                           child: Text('Please Select Payment Type',style: TextStyle(color: Colors.white),),
                         )),


                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (ctx,index){
                        return  Card(
                          elevation: 2,
                          color: Colors.white,
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.antiAlias,
                          child: Container(

                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffEAEDED),
                              border: Border.all(color: Color(0xffD5DBDB) ),
                            ),
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4,top: 5,bottom: 5),
                                    child: Image.network('https://mpss.com.mm/resources/img/partners/MPU.png',),
                                  ),

                                  SizedBox(width: 20,),

                                  Text('Credit/Debit Cards',textAlign: TextAlign.center,),

                                ],),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Icon(Icons.arrow_forward_ios_outlined,
                                    size: 20,),
                                ),
                              ],
                            ),
                          ),
                        );
                      },itemCount: 8,)


                  ],
                ),

            ),

          ],),
      ),
    );
  }
}

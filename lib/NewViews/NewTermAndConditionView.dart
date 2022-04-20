import 'package:flutter/material.dart';

class NewTermAndConditionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(12),
        child: _buildTermAndConditionParagraph(),
      ),
    );
  }

  Widget _buildTermAndConditionParagraph() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'These General Terms and Conditions shall apply to all Services provided by mojoenet.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'In other to user any of our services, Customer must :',
            textAlign: TextAlign.left,
            style: TextStyle( fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '• Be at least eighteen 18 years of age or',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '• Have obtained the consent of a parent or legally recognized guardian',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            'Customers Responsibility : ',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '• Comply with our instructions on the manner of installation,use or operation of the service and equipment.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '• Ensure that any and all equipment used in relation to a Service is used in accordance with the Law',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '• We reserve the right, at any time, to change, replace or upgrade any of its software,equipment, or network to ensure the continuity of any service.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),

          SizedBox(
            height: 17,
          ),
          Text(
            'Our Service :',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '• Mojoenet shall exert best effort to ensure the quantity of any service or of the signal or data transmitted as part of any Services'
                  ' However we cannot guarantee completely fault-free Services and Shall not be liable for any'
                  ' loss or damage with may be caused by the loss,disruption or corruption of any signals or data'
                  ' transmitted through or as part of any Service. Our goal is to strive to achieve more than 99% uptime'
                  ' in service at any time with the  ',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:MJN/views/HomeView.dart';
import 'package:flutter/material.dart';

class PackagePlanDetailView extends StatefulWidget {
  @override
  _PackagePlanDetailViewState createState() => _PackagePlanDetailViewState();
}

class _PackagePlanDetailViewState extends State<PackagePlanDetailView> {
  int changePageIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? HomeView()
        : Scaffold(
            body: SingleChildScrollView(
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
                  ],
                ),
              ),
            ),
          );
  }
}

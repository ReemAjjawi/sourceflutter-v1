import 'package:flutter/material.dart';

import 'package:flutter_application_run/modules/add_group/add_group_controller.dart';
import 'package:flutter_application_run/modules/group/group.dart';
import 'package:get/get.dart';

class AddGroup extends StatelessWidget {
  final AddGroupController addGroupController = Get.put(AddGroupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5591F),
        title: Text("Add Name For group"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "Please Enter Name For Group",
            //   style: TextStyle(fontSize: 20),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                controller: AddGroupController.name,
                keyboardType: TextInputType.name,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.account_circle_sharp,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Name",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 70, right: 70, top: 20),
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: GestureDetector(
                  child: Text(
                    "done",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    AddGroupController()
                        .addNameForGroup(AddGroupController.name);
                    Get.to(Group());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

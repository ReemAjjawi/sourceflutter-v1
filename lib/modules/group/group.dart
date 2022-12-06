import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_run/modules/group/group_controller.dart';
import 'package:get/get.dart';

import '../../models/add_group_model.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  final GroupController groupCon = Get.put(GroupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5591F),
        title: Text("Add File to group"),
      ),
      body: GestureDetector(
        onTap: () {
          groupCon.pickFile!();
          // Get.to();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: const EdgeInsets.only(left: 20, right: 20),
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
              child: const Text(
                "Upload File From Here",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
                // child:  groupCon.filetodisplay
                )
          ],
        ),
      ),
    );
  }
}

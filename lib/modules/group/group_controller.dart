import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_run/modules/group/group_service.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class GroupController extends GetxController {
  GroupService serv = GroupService();
  static FilePickerResult? result;
  static String? filename;
  static PlatformFile? pickfile;
  static RxBool isLoading = false.obs;
  static File? filetodisplay;
  GroupService ser = GroupService();
  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void pickFile() async {
    try {
      isLoading.value = true;
      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);
      if (result != null) {
        filename = result!.files.first.name;
        pickfile = result!.files.first;
        filetodisplay = File(pickfile!.path.toString());
        print('file name $filename');
        // OpenFile.open(filetodisplay.toString());
        //  _openFile(pickfile!);
        await serv.addFileToGroup(pickfile!.path!);
      }
    } catch (e) {
      print(e);
    }
  }

  void uploadFile() async {
    if (!isLoading.value) {
      isLoading(true);

      try {
        print("reeeeeeeeemo");

        await ser.addFileToGroup(filename!).then((value) {
          print("immmmmmmmmmmmmm in controllllller");
          Get.snackbar('file', 'file Successfully',
              snackPosition: SnackPosition.BOTTOM);
          // hzf async w read storage
        });
      } catch (e) {
        Get.snackbar('error on controller', '$e');
        print("error is the " + '$e');
      } finally {
        isLoading(false);
      }
    }
  }
}

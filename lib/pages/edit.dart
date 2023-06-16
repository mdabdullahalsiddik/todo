import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notepad/controller/home_controller.dart';

import '../static/all_color.dart';
import '../static/all_icon.dart';
import '../static/all_text.dart';

// ignore: must_be_immutable
class NoteEdit extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  List<int> index = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColor.greenColor,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: AllIcon.backIcon,
        ),
        title: AllText.editbar_Text,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          builder: (_) {
            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 500.0,
                      width: MediaQuery.sizeOf(context).width,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: AllColor.transparentColor,
                                actionsAlignment: MainAxisAlignment.spaceAround,
                                content: TextField(
                                  keyboardType: TextInputType.multiline,
                                  controller: editController,
                                  maxLines: 30,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AllColor.greenColor,
                                    hintText: "Writing.......",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                      borderSide: BorderSide(
                                        color: AllColor.blackColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                      borderSide: BorderSide(
                                        color: AllColor.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: AllText.cancalText,
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          AllColor.greenColor),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      homeController
                                          .editText(editController.text);

                                      Navigator.pop(context);
                                    },
                                    child: AllText.saveText,
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          AllColor.greenColor),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        onDoubleTap: () {},
                        child: Card(
                          color: AllColor.greenColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AllColor.blackColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                                child: Text(
                              homeController.text.value,

                              // homeController.edit[index],
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

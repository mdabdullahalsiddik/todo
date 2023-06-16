import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notepad/controller/home_controller.dart';
import 'package:notepad/routes.dart';
import 'package:notepad/static/all_color.dart';
import 'package:notepad/static/all_icon.dart';
import 'package:notepad/static/all_style.dart';
import 'package:notepad/static/all_text.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColor.greenColor,
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/book.jpg"),
          ),
        ),
        title: AllText.appbarText,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        backgroundColor: AllColor.transparentColor,
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        content: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AllColor.greenColor,
                            hintText: AllText.listTileHintText,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: AllColor.blackColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: AllColor.blackColor,
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              controller.clear();
                              Navigator.pop(context);
                            },
                            child: AllText.cancalText,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AllColor.greenColor),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                               homeController.tittleName(controller.text);
                              controller.clear();
                              Navigator.pop(context);
                            },
                            child: AllText.saveText,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AllColor.greenColor),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: AllIcon.add_Icon),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.titlle.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60.0,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(editPage);
                      },
                      onDoubleTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              backgroundColor: AllColor.transparentColor,
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              content: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AllColor.greenColor,
                                  hintText: AllText.listTileHintText,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: AllColor.blackColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
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
                                    homeController.tittleUpdate(homeController
                                        .titlle[index] = controller.text);
                                    controller.clear();

                                    Navigator.pop(context);

                                    ;
                                  },
                                  child: AllText.updateText,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      AllColor.greenColor,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                icon: AllIcon.deleteIcon,
                                title: AllText.deletText,
                                actionsAlignment: MainAxisAlignment.spaceAround,
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.clear();
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
                                      // homeController.titlle.removeAt(index);
                                      homeController.tittleDelet(index);
                                      Navigator.pop(context);
                                    },
                                    child: AllText.okText,
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          AllColor.greenColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Card(
                        color: index % 2 == 0
                            ? AllColor.greenColor
                            : AllColor.greengyColor,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.sms_outlined,
                                size: 30.0,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                homeController.titlle[index],
                                style: AllStyle.listStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

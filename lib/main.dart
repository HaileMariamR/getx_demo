import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/main_controller.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Getx Demo",
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appstate = Get.put(MainController());
    return Container(
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              appstate.increament();
            },
            child: Text("+"),
          )),
          Expanded(child: Obx(() => Text("${appstate.count}"))),
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              appstate.decreament();
            },
            child: Text("-"),
          )),
          Expanded(
              child: MaterialButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "First dialog",
                  middleText: "Getx Statemanagment!",
                  backgroundColor: Colors.green,
                  titleStyle: TextStyle(color: Colors.white),
                  middleTextStyle: TextStyle(color: Colors.white),
                  content: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          appstate.increament();
                        },
                        child: Text("+"),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          appstate.decreament();
                        },
                        child: Text("-"),
                      )),
                    ],
                  ));
            },
            child: Text("Show Dialog"),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sample_getx/pages/PageOne.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route Management")),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: Text("DenrusApps")),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Get.to(Home());
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: const Text("Menu 1"),
            onTap: () {
              Get.to(PageOne());
            },
          )
        ],
      )),
      body: Wrap(children: [
        Center(
          child: ElevatedButton(
            child: const Text("Snackbar"),
            onPressed: () {
              Get.snackbar("Hi", "I am a Denrus");
            },
            //onPressed: () => Get.to(Other()),
          ),
        ),
        Center(
          child: ElevatedButton(
            child: const Text("Dialog"),
            onPressed: () {
              Get.defaultDialog(
                  onConfirm: (() => print("Okay")),
                  middleText: "Hello dialog denrus");
            },
            //onPressed: () => Get.to(Other()),
          ),
        ),
      ]),
    );
  }
}

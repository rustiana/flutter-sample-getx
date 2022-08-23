import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Home(),
  ));
}

class User {
  User({String? name, int? age});
  var name;
  var age;
}

class Controller extends GetxController {
  var count = 0.obs;
  var name = "Denrus".obs;
  increment() => count++;
  final isLogged = false.obs;
  final balance = 0.0.obs;
  final number = 0.obs;
  final items = <String>[].obs;
  final myMap = <String, int>{}.obs;

  // Custom classes - it can be any class, literally
  final user = User(name: "Camila", age: 18).obs;
}

class ControllerSecond extends GetxController {
  int counter = 0;
  void increment() {
    counter++;
    update(); // use update() to update counter variable on UI when increment be called
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
          title: Obx(
        () => Text("Clicks: ${c.user.value.name}"),
      )),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Other"),
          onPressed: () {
            c.increment();
          },
          //onPressed: () => Get.to(Other()),
        ),
      ),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.name}")));
  }
}

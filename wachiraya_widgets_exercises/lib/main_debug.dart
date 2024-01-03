import 'package:flutter/cupertino.dart';

class MyDebugDemoClass {
  void displayFunc() {
    debugPrint("Hello there");
  }
}
void main() {
  MyDebugDemoClass x = MyDebugDemoClass();
  x.displayFunc();
}
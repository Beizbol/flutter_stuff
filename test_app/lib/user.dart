import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  String name;
  String email;
  int age;

  UserModel() {
    this.name = "testname";
    this.email = "test123@gmail.com";
    this.age = 0;
  }
}

class User extends StateNotifier<UserModel> {
  User() : super(UserModel());

  editName(String name) {
    state.name = name;
    state = state; // trigger update
  }

  editEmail(String value) {
    state.email = value;
    state = state; // trigger update
  }

  editAge(int _age) {
    state.age = _age;
    state = state; // trigger update
  }

  incAge() {
    editAge(state.age + 1);
  }

  rdmAge() {
    editAge(Random().nextInt(100));
  }

  fromJson(Map<String, dynamic> json) {
    state.name = json["Name"];
    state.age = json["Age"];
  }

  Map<String, dynamic> toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['Name'] = state.name;
    m['Age'] = state.age;
    return m;
  }
}

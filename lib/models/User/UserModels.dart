import 'package:flutter/material.dart';

class UserModelA {
  final String UserId;
  final String Base64Image;
  final String UserName;

  UserModelA(this.UserId, this.Base64Image, this.UserName);
}

class UserModelB {
  final String Base64Image;
  final String UserName;
  final String RealName;

  UserModelB(this.Base64Image, this.UserName, this.RealName);
}

// RAW DATA

import 'package:flutter/material.dart';

class Tag {
  String? title;
  IconData? icon;
  Color? primaryColor;
  Color? secondaryColor;

  Tag({this.title, this.icon, this.primaryColor, this.secondaryColor});
}

var tagData = {
  'Health': Tag(
      title: "Health ",
      icon: Icons.medical_information_outlined,
      primaryColor: Colors.red,
      secondaryColor: Colors.redAccent.shade100),
  'Food': Tag(
      title: "Food",
      icon: Icons.food_bank,
      primaryColor: Colors.green,
      secondaryColor: Colors.greenAccent.shade100),
  'Education': Tag(
      title: "Education",
      icon: Icons.cast_for_education,
      primaryColor: Colors.blue,
      secondaryColor: Colors.blueAccent.shade100),
};

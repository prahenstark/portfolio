import 'package:flutter/cupertino.dart';

class HeaderItems {
  final String title;
  final VoidCallback onTap;
  final bool isButton;

  HeaderItems({
    this.title,
    this.onTap,
    this.isButton = false,
  });

}
import 'package:agaela_app/constants/global_constants.dart';
import 'package:flutter/material.dart';

class AgaelaImageAppbar extends AppBar {
  AgaelaImageAppbar({super.key})
      : super(
            toolbarHeight: 75,
            flexibleSpace: Image.asset(
              logo,
              fit: BoxFit.contain,
            ));
}

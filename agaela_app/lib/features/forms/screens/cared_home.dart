import 'package:agaela_app/features/forms/widgets/careds_dropdown.dart';
import 'package:flutter/material.dart';

class CaredHome extends StatelessWidget {
  const CaredHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: <Widget>[CaredsDropdown()],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScrolleableWidget extends StatelessWidget {
  const ScrolleableWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        )
      ],
    );
  }
}

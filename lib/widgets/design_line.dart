import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_crud_ncf_app/widgets/line.dart';

class DesignLine extends StatelessWidget {
  const DesignLine(
      {super.key, required this.line1Length, required this.line2Length});
  final double line1Length;
  final double line2Length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Line(
          length: line1Length,
        ),
        Line(
          length: line2Length,
        ),
      ],
    );
  }
}

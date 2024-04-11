import 'package:flutter/material.dart';

double getHeight(BuildContext context, double per) {
  return MediaQuery.of(context).size.height * per / 100;
}

double getWidth(BuildContext context, double per) {
  return MediaQuery.of(context).size.width * per / 100;
}

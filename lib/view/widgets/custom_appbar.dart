import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar({
  required BuildContext context,
  bool navPop = false,
}) =>
    AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: navPop,
    );

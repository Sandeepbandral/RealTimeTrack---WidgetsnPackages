import 'package:flutter/material.dart';

class SecondaryAppBar extends PreferredSize {
  SecondaryAppBar(
    BuildContext context, {
    Key? key,
    required String title,
    List<Widget>? actions,
    Color? backgroundColor,
    VoidCallback? onBackPressed,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            actions: actions,
            leadingWidth: 70,
            titleSpacing: 0,
            backgroundColor: backgroundColor,
            title: Text(title),
            leading: IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.arrow_back_ios),
              ),
              splashRadius: 25,
              onPressed: onBackPressed ??
                  () {
                    Navigator.pop(context);
                  },
            ),
          ),
        );
}

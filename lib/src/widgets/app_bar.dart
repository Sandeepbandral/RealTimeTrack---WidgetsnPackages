import 'package:flutter/material.dart';

class SecondaryAppBar extends PreferredSize {
  SecondaryAppBar(
    BuildContext context, {
    Key? key,
    String title = '',
    List<Widget>? actions,
    Color? backgroundColor,
    VoidCallback? onBackPressed,
    Widget? titleWidget,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            actions: actions,
            leadingWidth: 70,
            titleSpacing: 0,
            backgroundColor: backgroundColor,
            title: titleWidget ?? (title.isNotEmpty ? Text(title) : null),
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

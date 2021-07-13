import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconMenue {
  final String text;
  final IconData icon;
  const IconMenue({
    required this.text,
    required this.icon,
  });
}

class IconsMenue {
  static const items = <IconMenue>[
    search,
    delete,
  ];
  static const search = IconMenue(icon: Icons.search, text: 'search');
  static const delete = IconMenue(icon: Icons.delete, text: 'Delete Notes');
}

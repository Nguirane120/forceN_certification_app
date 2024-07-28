import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});
  final Widget title;
  final Widget subtitle;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: const Icon(Icons.person),
    );
  }
}

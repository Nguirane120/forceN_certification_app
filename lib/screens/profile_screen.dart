import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/utils/extension.dart';
import 'package:todoapp/widgets/favorte.dart';
import 'package:todoapp/widgets/widgets.dart';

class ProfileWidget extends StatefulWidget {
  final String? imagePath;
  final VoidCallback? onClicked;

  const ProfileWidget({Key? key, this.imagePath, this.onClicked})
      : super(key: key);

  static ProfileWidget builder(BuildContext ctx, GoRouterState state) =>
      const ProfileWidget();

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool isEdit = false;

  /// List of Tab Bar Item
  List<String> items = [
    "Profile",
    "Favoris",
  ];

  /// List of body icon
  List<IconData> icons = [Icons.person, Icons.favorite];
  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Nombre d'onglets
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PROFILE"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(''),
              ),
              const Gap(10),
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.person), text: "Profile"),
                  Tab(icon: Icon(Icons.favorite_outline_sharp), text: "Favris"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const ProfileItem(
                      title: Text("Nom"),
                      subtitle: Text("Nguirane"),
                      icon: Icon(Icons.person),
                    ),
                    Favorte()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/widgets/common_input.dart';
import 'package:todoapp/widgets/display_white_text.dart';
import 'package:todoapp/widgets/select_categories.dart';
import 'package:todoapp/widgets/selecte_date_time.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({super.key});
  static CreateTask builder(BuildContext ctx, GoRouterState state) =>
      const CreateTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: "ADD NEW TASK"),
      ),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonInput(
              title: "TITLE",
              hint: "TITLE",
            ),
            SelecteCategory(),
            SelecteDatetime(),
            Gap(16),
            CommonInput(
              title: "NOTE",
              hint: "10",
            ),
            Gap(10),
            ElevatedButton(
                onPressed: null, child: DisplayWhiteText(text: "SAVE"))
          ],
        ),
      ),
    );
  }
}

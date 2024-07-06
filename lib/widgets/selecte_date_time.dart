import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/common_input.dart';

class SelecteDatetime extends ConsumerWidget {
  const SelecteDatetime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonInput(
            title: "DATE",
            hint: DateFormat.yMMMd().format(date),
            readOnly: true,
            suffixIcon: IconButton(
                onPressed: () => _selecDate(context, ref),
                icon: const FaIcon(FontAwesomeIcons.calendar)),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CommonInput(
            title: "TIME",
            hint: Helpers.timeToString(time),
            suffixIcon: IconButton(
                onPressed: () => _selectTime(context, ref),
                icon: FaIcon(FontAwesomeIcons.clock)),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      print(pickedTime);
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }

  Future<void> _selecDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.watch(dateProvider);
    DateTime? pickedDate = await showDatePicker(
        initialDate: initialDate,
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }
}

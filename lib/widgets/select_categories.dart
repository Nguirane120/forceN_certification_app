import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/utils/task_categories.dart';
import 'package:todoapp/utils/utils.dart';

class SelecteCategory extends ConsumerWidget {
  const SelecteCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selecetedCategory = ref.watch(categoryProvider);
    final categories = TaskCategory.values.toList();
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text("categories"),
          Expanded(
              child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, Index) {
                    final category = categories[Index];
                    return InkWell(
                      onTap: () {
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: category.color),
                          color: category.color.withOpacity(0.3),

                          // borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          category.icon,
                          color: category == selecetedCategory
                              ? context.colorScheme.primary
                              : category.color,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => Gap(10),
                  itemCount: categories.length))
        ],
      ),
    );
  }
}

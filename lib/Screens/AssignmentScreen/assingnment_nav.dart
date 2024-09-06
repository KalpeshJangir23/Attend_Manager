// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradle_kalpesh/Screens/AssignmentScreen/widgets/assignment_list.dart';
import 'package:gradle_kalpesh/model/assignment.dart';

class assNav extends ConsumerStatefulWidget {
  const assNav({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _assNavState();
}

class _assNavState extends ConsumerState<assNav> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: TabBar(
              controller: _tabController,
              dividerColor: Color.fromARGB(0, 44, 216, 65),
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              unselectedLabelColor: Colors.black,
              labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15),
              tabs: const [
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    child: Tab(text: 'All'),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    child: Tab(text: 'Pending'),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    child: Tab(text: 'Submitted'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          // Use Expanded to make it take available space
          child: TabBarView(
            controller: _tabController,
            children: const [
              AssignmentList(status: AssignmentStatus.all),
              AssignmentList(status: AssignmentStatus.pending),
              AssignmentList(status: AssignmentStatus.submitted),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gradle_kalpesh/Screens/AssignmentScreen/assignment_Screen.dart';
import 'package:gradle_kalpesh/Screens/Home_Screen/homeScreen.dart';

class TabNav extends StatefulWidget {
  const TabNav({super.key});
  @override
  State<TabNav> createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //tabcontroller.index can be used to get the name of current index value of the tabview.
        // title
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: "Attendance",
            ),
            Tab(
              text: "Assignment",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          HomeScreen(),
          AssignmentPage(),
        ],
      ),
    );
  }
}

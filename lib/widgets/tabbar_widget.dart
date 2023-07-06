import 'package:flutter/material.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({super.key});

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan TabBar'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Icon(Icons.send),
            Icon(Icons.notification_add),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(
            child: Text('SEND'),
          ),
          Center(
            child: Text('NOITFICATION'),
          )
        ],
      ),
    );
  }
}

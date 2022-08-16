import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.red,
          tabs: [
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        SizedBox(
          height: context.dynamicHeight(0.3),
          child: TabBarView(
            children: [
              Center(
                child: Text(
                  'Screen 1',
                ),
              ),
              Center(
                child: Text(
                  'Screen 2',
                ),
              ),
            ],
            controller: _tabController,
          ),
        )
      ],
    );
  }
}

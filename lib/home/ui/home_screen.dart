// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/dashboard/ui/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScren extends HookConsumerWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //tabbar controller
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
          bottomNavigationBar: Material(
            color: Colors.teal[400],
            elevation: 10,
            child: TabBar(
              indicatorColor: Colors.white,
              labelStyle: primaryTextStyle(size: 18, weight: FontWeight.w600),
              unselectedLabelStyle: primaryTextStyle(
                size: 18,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[300],
              labelPadding: const EdgeInsets.symmetric(horizontal: 2),
              tabs: const [
                Tab(
                  text: 'Profile',
                ),
                Tab(
                  //  icon: Icon(Icons.search),
                  text: 'Home',
                ),
                Tab(
                  //  icon: Icon(Icons.add),
                  text: 'Settings',
                ),
                Tab(
                  //  icon: Icon(Icons.add),
                  text: 'About us',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Profile Page'),
              ),
              DashboardScreen(),
              Center(
                child: Text('Settings Page'),
              ),
              Center(
                child: Text('About us Page'),
              ),
            ],
          )),
    );
  }
}

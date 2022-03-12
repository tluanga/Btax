// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/dashboard/ui/dashboard_screen.dart';
import 'package:btax/user/ui/user_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScren extends HookConsumerWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double iconSize = 26;
    double iconPadding = 4;
    //tabbar controller
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 61,
            child: Column(
              children: [
                Divider(
                  height: 1.2,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 58,
                  child: Material(
                    color: Colors.white,
                    // elevation: 50,
                    child: TabBar(
                      indicatorColor: Colors.grey.shade800,
                      labelStyle:
                          primaryTextStyle(size: 12, weight: FontWeight.w500),
                      unselectedLabelStyle: primaryTextStyle(
                        size: 11,
                      ),
                      indicatorWeight: 1,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey.shade800,
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 6),
                      tabs: [
                        Tab(
                          icon: Column(
                            children: [
                              Icon(
                                CupertinoIcons.person,
                                size: iconSize,
                              ),
                              SizedBox(
                                height: iconPadding,
                              ),
                              const Text('Profile'),
                            ],
                          ),
                        ),
                        Tab(
                          icon: Column(
                            children: [
                              Icon(
                                CupertinoIcons.home,
                                size: iconSize,
                              ),
                              SizedBox(
                                height: iconPadding,
                              ),
                              const Text('Home'),
                            ],
                          ),
                        ),
                        Tab(
                          icon: Column(
                            children: [
                              Icon(
                                CupertinoIcons.settings,
                                size: iconSize,
                              ),
                              SizedBox(
                                height: iconPadding,
                              ),
                              const Text('Settings'),
                            ],
                          ),
                        ),
                        Tab(
                          icon: Column(
                            children: [
                              Icon(
                                CupertinoIcons.doc_person,
                                size: iconSize,
                              ),
                              SizedBox(
                                height: iconPadding,
                              ),
                              const Text('About us'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              UserProfileScreen(''),
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

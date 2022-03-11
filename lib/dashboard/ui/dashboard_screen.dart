import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/dashboard/ui/widget/select_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 14, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: boldTextStyle(size: 30, color: Colors.teal),
              ),
              const SizedBox(height: 4),
              // Container(
              //   width: 150,
              //   height: 2,
              //   color: Colors.grey[900],
              // ),
              const SizedBox(height: 20),

              Text(
                'Welcome to your dashboard',
                style: primaryTextStyle(size: 20, color: Colors.teal.shade400),
              ),
              const SizedBox(height: 6),
              Text(
                'Plese select a from you are interested in',
                style: primaryTextStyle(size: 20, color: Colors.teal),
              ),
              const SizedBox(height: 30),
              selectForm(),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 2,
              //   color: Colors.grey[900],
              // ),
              const SizedBox(height: 20),
              Text(
                'History',
                style: boldTextStyle(size: 19, color: Colors.teal),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.teal.shade400,
                  // border: Border.all(color: Colors.grey.shade700),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  'No past activities have been found',
                  style:
                      primaryTextStyle(size: 18, color: Colors.grey.shade100),
                ),
              ),

              const SizedBox(height: 20),
              Text(
                'Remove History?',
                style: boldTextStyle(size: 18, color: Colors.red.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

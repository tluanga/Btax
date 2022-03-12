import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/dashboard/ui/widget/select_form.dart';
import 'package:btax/user/setup/ui/widget/textformfield_dropdown_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 14, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dashboard',
                      style:
                          boldTextStyle(size: 28, color: Colors.grey.shade700),
                    ),
                    const Icon(CupertinoIcons.search)
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // Container(
              //   width: 150,
              //   height: 2,
              //   color: Colors.grey[900],
              // ),
              const SizedBox(height: 20),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0.2,
                child: Container(
                  height: 150,
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to your dashboard',
                        style: primaryTextStyle(
                            size: 20, color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Plese select a from you are interested in',
                        style: primaryTextStyle(
                            size: 20, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              selectForm(),
              // const Spacer(
              //   flex: 1,
              // ),

              const SizedBox(height: 20),

              Text(
                '  History',
                style: boldTextStyle(size: 19, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 8),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: textFormFieldDropdownButton(
                      ['No past activities have been found'],
                      'No past activities have been found',
                      TextEditingController(),
                      '',
                      '',
                      topPadding: 0,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '  Remove History?',
                style: boldTextStyle(size: 16, color: Colors.red.shade300),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

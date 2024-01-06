import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/res/app_color.dart';

import '../../res/routes/routes_name.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: _isDark ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.colorblack,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: const Text(
              'Account',
              style: TextStyle(fontSize: 20,fontFamily: 'FontInter'),
            ),
          ),
          body: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ListView(
                children: const [
                  _SingleSection(
                    children: [
                      _CustomListTile(
                          title: 'Personal Details',
                          icon: Icons.account_circle_outlined,
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                          listItemClickType: 'personaldetails')
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                          title: 'Payments',
                          icon: Icons.payments,
                          trailing: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                          title: 'Privacy and Security',
                          icon: Icons.security,
                          trailing: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String? listItemClickType;
  final IconData icon;
  final Widget? trailing;

  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing, this.listItemClickType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: const TextStyle(fontFamily: 'FontIner'),),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {
        switch (listItemClickType){
          case 'personaldetails':
            Get.toNamed(RouteName.personalDetails);
            break;
        }
      },
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}

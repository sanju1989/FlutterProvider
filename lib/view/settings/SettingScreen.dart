import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/res/routes/routes_name.dart';

import '../../res/app_color.dart';
import '../dialogs/logoutdialog.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text(
            'Settings and privacy',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                _SingleSection(
                  children: [
                    _CustomListTile(
                        title: 'Account',
                        icon: Icons.account_box,
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                        listItemClickType: 'account'
                    )
                  ],
                ),
                _SingleSection(
                  title: "Personalization",
                  children: [
                    _CustomListTile(
                        title: "Dark Mode",
                        icon: Icons.dark_mode_outlined,
                        trailing: Switch(
                            value: _isDark,
                            onChanged: (value) {
                              setState(() {
                                _isDark = value;
                              });
                            }),
                        ),
                    const _CustomListTile(
                      title: "Language",
                      icon: Icons.language,
                      trailing: Icon(Icons.arrow_forward_ios_outlined),

                    ),
                    const _CustomListTile(
                      title: "Accessibility",
                      icon: CupertinoIcons.lock_shield,
                      trailing: Icon(Icons.arrow_forward_ios_outlined),

                    ),
                  ],
                ),
                const Divider(),
                const _SingleSection(
                  title: "Notification and connections",
                  children: [
                    _CustomListTile(
                        title: "Manage Notification",
                        icon: Icons.notifications_none,
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                        listItemClickType: 'manageNotification'
                        ),
                    _CustomListTile(
                        title: "Social Media",
                        icon: Icons.social_distance,
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                        listItemClickType: 'socialMedia'

                    ),
                  ],
                ),
                const Divider(),
                const _SingleSection(
                  title: "More Information and support",
                  children: [
                    _CustomListTile(
                        title: "Help",
                        icon: Icons.help_outline_rounded,
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                        listItemClickType: 'help'
                        ),
                    _CustomListTile(
                        title: "About",
                        icon: Icons.info_outline_rounded,
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                        listItemClickType: 'about'
                        ),
                  ],
                ),
                const Divider(),
                const _SingleSection(
                  title: "Login",
                  children: [
                    _CustomListTile(
                        title: "Log Out",
                        icon: Icons.logout_rounded,
                      listItemClickType: 'logout',
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {
        switch (listItemClickType) {
          case 'account':
            Get.toNamed(RouteName.accountScreen);
            break;
          case 'manageNotification':
            Get.toNamed(RouteName.manageNotification);
            break;
          case 'socialMedia':
            Get.toNamed(RouteName.socialMediaScreen);
            break;
          case 'about':
            Get.toNamed(RouteName.aboutScreen);
            break;
          case 'help':
            Get.toNamed(RouteName.helpScreen);
            break;
          case 'logout':
            Get.dialog(LogOutScreen());
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
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title!,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          Column(
            children: children,
          ),
        ],
      ),
    );
  }
}

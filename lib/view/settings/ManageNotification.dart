import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageNotification extends StatefulWidget {
  const ManageNotification({super.key});

  @override
  State<ManageNotification> createState() => _ManageNotificationState();
}

class _ManageNotificationState extends State<ManageNotification> {
  bool _isDark = true;
  bool _isEventRqst = false;
  bool _isRevenueUpdt = false;
  bool _isUpcomingEvnt=false;
  bool _isChangeInDuty=false;
  bool _isUpdateMenuPrice=false;
  bool _isAnayltics=false;
  bool _isNotifyMoreTrnas=false;


  @override
  Widget build(BuildContext context) {
    return Theme(
        data: _isDark ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: const Text(
              'Manage Notifications',
              style: TextStyle(fontSize: 22, fontFamily: 'FontInter'),
            ),
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: ListView(
                children: [
                  _SingleSection(
                    children: [
                      _CustomListTile(
                        title: 'Event Request',
                        icon: Icons.account_circle_outlined,
                        trailing: Switch(
                            value: _isEventRqst,
                            onChanged: (value) {
                              setState(() {
                                _isEventRqst = value;
                              });
                            }),
                      )
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                        title: 'Revenue Update',
                        icon: Icons.payments,
                        trailing: Switch(
                            value: _isRevenueUpdt,
                            onChanged: (value) {
                              setState(() {
                                _isRevenueUpdt = value;
                              });
                            }),
                      )
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                        title: 'Upcoming Events',
                        icon: Icons.security,
                        trailing: Switch(
                            value: _isUpcomingEvnt,
                            onChanged: (value) {
                              setState(() {
                                _isUpcomingEvnt = value;
                              });
                            }),
                      )
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                        title: 'Change in duty',
                        icon: Icons.security,
                        trailing: Switch(
                            value: _isChangeInDuty,
                            onChanged: (value) {
                              setState(() {
                                _isChangeInDuty = value;
                              });
                            }),
                      )
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                        title: 'Update Menu or Price',
                        icon: Icons.security,
                        trailing: Switch(
                            value: _isUpdateMenuPrice,
                            onChanged: (value) {
                              setState(() {
                                _isUpdateMenuPrice = value;
                              });
                            }),
                      )
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                        title: 'Analytical Report',
                        icon: Icons.security,
                        trailing: Switch(
                            value: _isAnayltics,
                            onChanged: (value) {
                              setState(() {
                                _isAnayltics = value;
                              });
                            }),
                      )
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                        title: 'Notify for transaction more than',
                        icon: Icons.security,
                        trailing: Switch(
                            value: _isNotifyMoreTrnas,
                            onChanged: (value) {
                              setState(() {
                                _isNotifyMoreTrnas = value;
                              });
                            }),
                      )
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
  final IconData icon;
  final Widget? trailing;

  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontFamily: 'FontIner'),
      ),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {},
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

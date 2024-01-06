import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool _isDark = true;

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
              'Help',
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
                          title: 'Report a problem',
                          icon: Icons.message,
                          trailing: Icon(Icons.report_problem_outlined))
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                          title: 'Help Center',
                          icon: Icons.payments,
                          trailing: Icon(Icons.help_center_outlined))
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
      title: Text(title,style: const TextStyle(fontFamily: 'FontIner'),),
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

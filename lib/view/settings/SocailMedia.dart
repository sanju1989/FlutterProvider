import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
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
              'Social Media',
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
                          title: 'Instagram',
                          icon: Icons.message,
                          trailing: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                          title: 'Facebook',
                          icon: Icons.payments,
                          trailing: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                          title: 'Twitter',
                          icon: Icons.security,
                          trailing: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                  Divider(),
                  _SingleSection(
                    children: [
                      _CustomListTile(
                          title: 'SMS',
                          icon: Icons.message,
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

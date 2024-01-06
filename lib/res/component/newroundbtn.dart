import 'package:flutter/material.dart';

class NewRoundbtn extends StatelessWidget {
  final String title;
  final double radius;

  final bool loading;

  final VoidCallback onPress;

  const NewRoundbtn({
    Key? key,
    required this.title,
    this.radius=10,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
       // margin: EdgeInsets.only(top: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(radius)),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
              color: Colors.white,
            )
                : Text(
              title,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

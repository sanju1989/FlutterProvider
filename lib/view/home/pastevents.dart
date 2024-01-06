import 'package:flutter/material.dart';
class PastEvents extends StatefulWidget {
  const PastEvents({super.key});

  @override
  State<PastEvents> createState() => _PastEventsState();
}

class _PastEventsState extends State<PastEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text("Past Events",style: TextStyle(color: Colors.black,fontSize: 25,fontFamily: "FontInter"),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(padding: EdgeInsets.all(15),
      child:ListView(
        children: const <Widget>[
          SizedBox(
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mon, 13 sept 23',
                        style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w200,),
                      ),
                      Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                            fontSize: 20,
                           fontFamily: "FontInter",
                            color: Colors.black),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '\$10000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mon, 13 sept 23',
                        style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w200,),
                      ),
                      Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "FontInter",
                            color: Colors.black),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '\$10000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mon, 13 sept 23',
                        style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w200,),
                      ),
                      Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "FontInter",
                            color: Colors.black),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '\$10000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mon, 13 sept 23',
                        style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w200,),
                      ),
                      Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "FontInter",
                            color: Colors.black),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '\$10000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
      ),
    );
  }
}

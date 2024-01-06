import 'package:flutter/cupertino.dart';
import 'package:skdoosh/res/app_color.dart';

class ExampleCandidateModel {
  String name;
  String job;
  String city;

  //List<Color> color;
  List<EventsforVenu> cars;
  Color color;

  ExampleCandidateModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
    required this.cars,
  });
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'One, 1',
    job: 'Developer',
    city: 'Areado',
    cars: eventList,
    // color: const [Color(0xFFB3B3E1), Color(0xFFB3B3E1)],
    color: AppColor.primaryBg,
  ),
  ExampleCandidateModel(
    name: 'Two, 2',
    job: 'Manager',
    city: 'New York',
    cars: eventList,
    // color: const [Color(0xFFE6E6FA), Color(0xFFE6E6FA)],
    color: AppColor.signinpage,
  ),
  ExampleCandidateModel(
    name: 'Three, 3',
    job: 'Engineer',
    city: 'London',
    cars: eventList,
    //color: const [Color(0xFFE6E6FA), Color(0xFFE6E6FA)],
    color: AppColor.signinpage,
  ),
  ExampleCandidateModel(
    name: 'Four, 4',
    job: 'Designer',
    city: 'Tokyo',
    cars: eventList,
    //color: const [Color(0xFFE6E6FA), Color(0xFFE6E6FA)],
    color: AppColor.signinpage,
  ),
];

class EventsforVenu {
  EventsforVenu(
      {required this.name,
      required this.date,
      required this.time,
      required this.location,
      required this.charges});

  String name;
  String date;
  String time;
  String location;
  String charges;
}

var eventList = [
  EventsforVenu(
      name: 'Pulse Party',
      date: '01 Sept 2023',
      time: '7:00 Hrs',
      location: 'Cyber Hub',
      charges: '2000',
  ),

  EventsforVenu(
    name: 'Chilly hub',
    date: '11 Oct 2023',
    time: '17:00 Hrs',
    location: 'Chilly Hub',
    charges: '2000',
  ),
  EventsforVenu(
    name: 'Coffee hub',
    date: '11 Sept 2023',
    time: '12:00 Hrs',
    location: 'Coffee Hub',
    charges: '2000',
  ),
  EventsforVenu(
    name: 'Chocolate hub',
    date: '21 Sept 2023',
    time: '20:00 Hrs',
    location: 'Chocolate Hub',
    charges: '2000',
  ),
  EventsforVenu(
    name: 'Dcotor hub',
    date: '11 Dec 2023',
    time: '7:00 Hrs',
    location: 'Dcotor Hub',
    charges: '2000',
  ),
  EventsforVenu(
    name: 'Office hub',
    date: '10 Dec 2023',
    time: '21:00 Hrs',
    location: 'Office Hub',
    charges: '2000',
  )
];

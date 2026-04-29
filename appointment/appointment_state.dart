import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentState {
  AppointmentState();
  RxInt? currentIndex;
  RxString option = 'main'.obs;
  RxBool isAppBarCollapsed = false.obs;
  final List<String> filters = [
    "Filter",
    "Addiction",
    "Sexual Abuse",
    "Fear",
    "Faith"
  ];
  final List<Map<String, dynamic>> stats = [
    {"icon": Icons.person_outline, "value": "150+", "label": "Patients"},
    {"icon": Icons.trending_up, "value": "9+", "label": "Years Exp."},
    {"icon": Icons.star_border, "value": "4.8", "label": "Ratings"},
    {"icon": Icons.chat_bubble_outline, "value": "3,485", "label": "Reviews"},
  ];
  var selectedDate = DateTime.now().obs;
  RxBool isSelected = false.obs;
  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  List<DateTime> getWeekDates() {
    DateTime now = DateTime.now();
    return List.generate(7, (index) => now.add(Duration(days: index)));
  }

  // String get formattedMonth => DateFormat.MMMM().format(selectedDate.value);

  List<String> timeSlots = [
    "08:00AM",
    "08:30AM",
    "09:00AM",
    "09:30AM",
    "10:00AM",
    "10:30AM"
  ];
  var selectedTime = "".obs;
  final List<Map<String, String>> plans = [
    {
      "title": "Individual Plan",
      "description": "Click To Join Therapy Plan You Can Be Abl To Pay For.",
      "icon": "user"
    },
    {
      "title": "HMO Plan",
      "description": "Click To Join Therapy Plan Covered By Your HMO.",
      "icon": "circle"
    },
    {
      "title": "Corporate Plan",
      "description": "Click To Join Therapy Plan Covered By Your Company.",
      "icon": "circle"
    },
    {
      "title": "Student Plan",
      "description":
          "Click To Join Therapy Plan For Students In Higher Institution.",
      "icon": "user"
    },
  ];
  final List<Map<String, dynamic>> planValue = [
    {
      "title": "Basic Plan",
      "price": {
        "Weekly": "₦4,200",
        "Monthly": "₦14,200",
        "Quarterly": "₦43,200",
        "Annually": "₦143,200",
      },
      "features": [
        "One Live Messaging Conversation Per Week",
        "Therapy Session Scheduling",
        "Smart Therapist Matching",
        "Audio Session Only"
      ]
    },
    {
      "title": "Standard Plan",
      "price": {
        "Weekly": "₦4,200",
        "Monthly": "₦14,200",
        "Quarterly": "₦43,200",
        "Annually": "₦143,200",
      },
      "features": [
        "One Live Messaging Conversation Per Week",
        "Therapy Session Scheduling",
        "Smart Therapist Matching",
        "Audio Session Only"
      ]
    },
    {
      "title": "Premium Plan",
      "price": {
        "Weekly": "₦4,200",
        "Monthly": "₦14,200",
        "Quarterly": "₦43,200",
        "Annually": "₦143,200",
      },
      "features": [
        "One Live Messaging Conversation Per Week",
        "Therapy Session Scheduling",
        "Smart Therapist Matching",
        "Audio Session Only"
      ]
    },
  ];

  // .....................................Chat........................
  var messages = [
    Message(content: 'Hi, this is Doctor Adewale Sarah', user: true)
  ].obs;
}

class Message {
  final String content;
  final bool user;
  Message({required this.content, required this.user});
}

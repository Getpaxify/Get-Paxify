import 'package:get/get.dart';

class NotificationItem {
  final String title;
  final String message;
  final String date;
  final String time;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
    required this.time,
  });
}

class NotificationState {
  RxList<NotificationItem> notifications = <NotificationItem>[
    NotificationItem(
      title: "Upcoming Appointment",
      message:
          "You Have An Upcoming Appointment With Dr. Sara Doe On The 12th Of November 2025 At Exactly 12:00PM Via Google Meet.",
      date: "Sept 25th, 2025",
      time: "7:00–8:00PM",
    ),
    NotificationItem(
      title: "Upcoming Appointment",
      message:
          "You Have An Upcoming Appointment With Dr. Sara Doe On The 12th Of November 2025 At Exactly 12:00PM Via Google Meet.",
      date: "Sept 25th, 2025",
      time: "7:00–8:00PM",
    ),
    NotificationItem(
      title: "Upcoming Appointment",
      message:
          "You Have An Upcoming Appointment With Dr. Sara Doe On The 12th Of November 2025 At Exactly 12:00PM Via Google Meet.",
      date: "Sept 25th, 2025",
      time: "7:00–8:00PM",
    ),
  ].obs;
}

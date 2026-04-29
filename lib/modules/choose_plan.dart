import 'package:get/get.dart';

class ChooseOptionState {
  ChooseOptionState();
  List<Option> options = [
    Option(
        title: 'I need help (patient)',
        subTitle:
            'For individuals seeking guidance or support from mental health professionals'),
    Option(
        title: 'I am a Consultant',
        subTitle: 'For professionals offering mental health services.')
  ];
  RxInt optionGoupValue = 0.obs;

  List<String> occupation = [
    'Business Owner',
    'Employed',
    'Student',
    'Retired',
    'Unemployed',
    'Veteran'
  ];

  List<String> plan = ['Pay as you go', 'Subscribe to a subscription plan'];

  RxInt currentIndex = 0.obs;
  RxInt currentIndexI = 0.obs;
  var proceedWith = Hmo.nonHmo.obs;
  RxString mode = ''.obs;
  RxInt userNature = 0.obs;
}

class Option {
  final String title;
  final String subTitle;
  Option({required this.title, required this.subTitle});
}

enum Hmo { hmo, nonHmo, corporate }

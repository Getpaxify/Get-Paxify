import 'package:get/get.dart';
import 'package:paxify/model/assessment_category_model.dart';

class AssessmentState {
  AssessmentState();
  final List<Map<String, String>> steps = [
    {
      'title': 'Guide Your Therapist',
      'description':
          'Answer A Few Questions To Help Your Therapist Understand Your Needs.',
      'icon': 'favorite',
    },
    {
      'title': 'Book An Intake Call',
      'description':
          'Choose Your Therapist And Book An Audio Or Video Call Session.',
      'icon': 'calendar_today',
    },
    {
      'title': 'Meet With Your Therapist',
      'description':
          'Discuss Your Needs And Decide If Our Program Is Right For You.',
      'icon': 'chat',
    },
    {
      'title': 'Feel Better In No Time',
      'description':
          'Begin Your Program To Access Interactive Practices And Ongoing Therapist Support.',
      'icon': 'check_circle',
    },
  ];

  final List<String> tags = [
    "Anxiety",
    "Fear",
    "Pain",
    "Anger",
    "Heartbreak",
    "PTSD",
    "Drug Addiction",
    "Personality Disorder",
    "Depression",
    "Mental Health",
    "Emotional Trauma"
  ];

  RxDouble sliderValue = 0.0.obs;

  final List<String> labels = ["Slightly", "Fairly", "Very", "Extremely"];
  final List<double> divisions = [0.0, 33.3, 66.6, 100.0];

  final List<Map<String, String>> causes = [
    {'cause': "Work", 'description': ''},
    {'cause': "Health", 'description': ''},
    {'cause': "Education", 'description': ''},
    {'cause': "Family", 'description': ''},
    {'cause': "Finances", 'description': ''},
    {'cause': "Friends/ Peers", 'description': ''},
    {'cause': "Stress", 'description': ''},
    {'cause': "Impulsivity", 'description': ''},
  ];
  RxList<Map<String, String>> selectedCauses = RxList();
  var achieve = [].obs;
  Rxn<AssessmentCategory?> selectedCategory = Rxn(null);
  RxBool isLoading = false.obs;
  RxnInt currentIndex = RxnInt(null);
  // ,................................................
  RxList<AssessmentCategory> allAssessment =
      RxList<AssessmentCategory>.from([]);
      RxList<String> selectedAddiction =
      RxList<String>.from([]);
  RxString intensity = 'Slightly'.obs;
    RxInt reloadTime = 0.obs;
    RxInt reloadTy = 0.obs;
}

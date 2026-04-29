import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paxify/model/get_doctor_model.dart';
import 'package:paxify/model/upcoming_appointment_model.dart';

class HomeState {
  HomeState();

  RxInt? currentIndex;
  RxString option = 'main'.obs;
  RxString id = 'main'.obs;
  RxBool isAppBarCollapsed = false.obs;
  RxBool isBookDoctor = false.obs;
  final List<String> filters = [
    "Filter",
    "Addiction",
    "Sexual Abuse",
    "Fear",
    "Faith"
  ];

  var selectedDate = DateTime.now().obs;
  RxBool isSelected = false.obs;
  void selectDate(DateTime date) {
    selectedDate.value = date;
    log(selectedDate.value.toString());
  }

  List<DateTime> getWeekDates() {
    DateTime now = DateTime.now();
    return List.generate(7, (index) => now.add(Duration(days: index)));
  }

  String get formattedMonth => DateFormat.MMMM().format(selectedDate.value);

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
  RxString selectdPriceId = ''.obs;
  RxInt selectdPrice = 0.obs;
  RxList<int> selectedPrices = <int>[].obs;
  RxList<int> selectedExpiredDay = <int>[].obs;
  RxList<String> selectedPriceIds = <String>[].obs;

  RxBool isLoading = false.obs;
  RxBool isUpcoming = false.obs;
  RxList<GetDoctorData> doctor = RxList<GetDoctorData>.from([]);
  RxList<UpcomingAppointmentData> upcomingAppointment =
      RxList<UpcomingAppointmentData>.from([]);
  List<ArticleModel> article = [
    ArticleModel(title: 'We’re Missing the Good News About Youth Mental Health', image: 'images/daily.png', body: 'Let’s play a word-association game. If I say “youth mental health,” what’s the next word that comes to mind? It’s probably “crisis.” For over a decade, researchers, policymakers, teachers, parents, and the media have been raising the alarm about the rising prevalence of anxiety, depression, and emotional distress among young people. Most alarmingly, the suicide rate among people aged 10–24 jumped 62% from 2007 through 2021, after remaining stable for a half-decade before that. The American Academy of Pediatrics, American Academy of Child and Adolescent Psychiatry, and Children’s Hospital Association jointly declared a national emergency in child and adolescent mental health in 2021. The U.S. Surgeon General issued a youth mental health advisory in 2021 and a second, specifically on social media, in 2023. Technology use and the COVID-19 pandemic have both been identified as major vectors exacerbating the crisis globally. I myself published books about each of these phenomena and their negative impact on youth well-being, and I am now writing about a third factor that, research says, hurts youth mental health: climate change. But more recently, things have been looking up in many ways. And while there are certainly still disparities and major gaps to be addressed, the incipient positive turn in youth well-being is not receiving the same amount of attention as the negative trendlines before it. Experts in the field say that’s a growing problem, because if you don’t focus on the areas of improvement, you may miss what’s causing them and how to build on that success. More youth are flourishing “There seems to be this reflex to talk about the crisis and play up the numbers,” says Daniel Eisenberg at UCLA. He is a principal investigator of the Healthy Minds Network (HMN) for Research on Adolescent and Young Adult Mental Health. The network administers a national survey study of college student mental health and related factors. Their most recent data show a two-year uptick in college students who are flourishing, for the first time since 2012. And that’s not the only bright spot. Eisenberg says: Recent data from a variety of sources, not just ours, suggest that young adults and adolescents are reporting a little bit less distress compared to previous years. There’s less loneliness. Suicidal ideation and severe anxiety seem to be declining. Everything is moving together as you might expect. Even suicides have ticked down slightly. Suicide rates fell 0.66% from 2022 to 2023 among people aged 15–24, with a bigger, 2.5% drop for 25–34 year olds. Some of the improvements may be from the increase in attention, funding, and resources in response to the crisis. Eisenberg says that there is an uptick in young people using apps and telehealth to support their well-being. As one example, peer-reviewed data from users of the Roadmap mHealth App, a mental health app, published in January 2025, showed significant decreases in depression, anxiety, and loneliness and an increase in “flourishing” between 2020 and 2022. The improvement may also signal a rebound from the depths of the pandemic itself.The Center for Collegiate Mental Health reported students’ academic distress peaked following the beginning of COVID-19 and declined each of the past three years, returning eventually to pre-pandemic levels. Students’ self-reported frustration levels in that study have also shown a gradual decline from 2010 to 2024. Highlighting resilience There’s also many positive recent survey results that highlight the general resilience of young people. Surgo Health’s Youth Mental Health Tracker, published in December 2024 with responses from 4,500 youth, had four in five reporting being satisfied with life, happy, and feeling that what they do in life is meaningful. In a national Hopelab survey released in July 2025, 55% rated their mental health as “good,” “very good,” or “excellent,” and 57% expressed optimism about their own futures, even though they had significant worries about the future of the country and the world. Hearteningly, 70% said they have “people in my life who really care about me.” And in July 2024, a whopping 94% of 10 to 18 year olds told Gallup and the Walton Family Foundation that they felt happiness “a lot” of the prior day. Substance abuse trends among young people deserve special mention here. For decades, alcohol and drug abuse have killed many tens of thousands of Americans per year. These are often classified as deaths of despair. Substance abuse and addiction are intimately interrelated with mental health. So how are young people doing in this respect? Well, at the end of 2024, the National Institutes of Health reported an “unprecedented” trend in the reduction of illicit substance use among teenagers. Drug and alcohol use dropped during the pandemic and has continued to drop. The cohort who went through lockdowns in eighth grade is now graduating high school, and they are the soberest generation of teenagers in decades. Distress still too high Every researcher interviewed for this article emphasized that levels of distress among young people are still too high. They are disproportionately high for girls, for LGBTQ+ youth, for Black and Hispanic youth, and for those who struggle economically. The question is how to build on what’s going right, and use still-limited resources to create solutions that work for all young people. Eisenberg is part of an informal group of researchers who are working on “challenging the crisis narrative” in youth mental health. “One of the points is to push back against the idea that we need to get as many people as possible into mental health care.” He advocates starting instead with a public health approach that focuses on prevention, including healthy habits, and offering many tiers of support across a population. Robert F. Kennedy Jr., the U.S. Secretary of Health and Human Services, and his Make America Healthy Again movement have also emphasized the importance of factors like exercise and healthy food, rather than medical interventions and psychoactive medications, to promote youth well-being. But Eisenberg says he advocates a more balanced and evidence-based approach that maintains access to clinical resources when indicated. Stephanie Malia Krauss concurs. She’s an educational consultant, social worker, and author of three books on youth well-being, including the forthcoming How We Thrive.“We’re in a little bit of a Chicken Little moment,” she says. “The crisis can be confusing, and mental health gets linked with mental illness so strongly.” Her new book recommends focusing on establishing the basics of well-being that are beneficial for everyone, like good sleep, outdoor time, physical movement, and strong, supportive relationships. “As a rule, young people have such intense inner wisdom,” say Krauss. “Their behavior will talk for them, and they are telling us what they need.” Emma Bruehlman-Senecal, principal researcher at Hopelab, came to a similar conclusion by asking young people themselves. Hopelab’s most recent national poll was developed with a panel of 30 advisors aged 13–24. “They told us what we were missing,” she says. “There needs to be more nuance to the conversation of what’s helping as well as hurting young people’s well being.” So, in addition to collecting information about stressors, the poll asked young people to name the factors in their life that they think are most supportive of their mental health. The top three? Solo downtime, face-to-face friend time, and getting enough sleep. By centering young people and their agency in their research design, Bruehlman-Senecal and her colleagues hoped to counteract the “crisis narrative” of a “lonely, lost generation,” with one that focuses on strength and the capacity for growth. While they are realistic about challenges facing themselves and the world, Bruehlman-Senecal says, “A top source of young people’s hope for the future was faith in their own resilience. Which flies in the face of young people being these fragile snowflakes that crumble at the slightest pressure.”'),
      ArticleModel(title:'With 17% of people in the Region living with a mental health condition, 31 countries commit to integrating mental health into all policies', image: 'images/d2.png', body: 'Paris, 16 June 2025 Representatives of 31 countries are calling for mental health to be a key component of all national policy decisions, regardless of government sector, if the WHO European Region is to truly address growing mental health challenges and promote health and well-being. The situation is critical: 1 in 6 people in the Region is living with a mental health condition. 1 in 3 people with a mental health condition does not receive the treatment they need. 1 in 4 people with psychosis receives no formal treatment or care at all. Over 120 000 people die by suicide each year – this is over 300 suicides every day. Suicide is the leading cause of death among young people aged 15–29. During the COVID-19 pandemic, the prevalence of anxiety and depression increased by 25% globally. The Region faces a critical shortage of health workers, especially mental health professionals. More than 1 in 10 (11%) adolescents show signs of problematic social media behaviour. A quarter of 15-year-old girls report being lonely most or all of the time. 1 in 4 older people aged over 60 reports being lonely. At the same time, 90% of 29 countries in a WHO survey said they were working on new or updated mental health policies with input from key groups, including sectors such as education, social services, finance and employment. One of the main things that will help these policies work is having systems in place for different sectors to collaborate. In response to the findings of the survey and a series of national discussions on mental health policies with 23 countries, a landmark conference is being hosted in Paris, France, by WHO/Europe and the French Ministry of Health. It brings together ministers and high-level representatives of health, education, social affairs and disabilities, housing and urban affairs, justice, family and youth, culture, and innovation. All are calling for breaking down the siloed and disjointed approach to mental health. They are joined in their call by people living with mental health conditions, health professionals, academics and civil society groups. The Paris Statement lays out the key priorities and shared policy directions that have been agreed upon, including the following: Align accountability and funding across sectors and government levels. Actively involve mental health service users from the outset in policy design, implementation and evaluation. Promote social and intergenerational connections through public spaces and services that reduce discrimination against people with mental health conditions. Engage schools, prisons, workplaces, media, youth, urban planning and health/social care settings to develop and implement prevention initiatives. Promote safe use of online mental-health resources as well as digital literacy to help keep people, especially youth, safe online. “Mental health shapes every heartbeat of our daily lives – in the classroom and the workplace, at the kitchen table and in the corridors of power,” said Dr Hans Henri P. Kluge, WHO Regional Director for Europe. “When we weave mental well-being into every decision, in every sector, we do more than ease suffering; we kindle dignity, hope and opportunity for all. Our latest data show anxiety tightening its grip on young people, while too many older adults endure the quiet ache of loneliness,” he added. “A strong, fair and healthy Region will not be built by health ministries alone. It will be built by all of us, standing shoulder to shoulder, across disciplines and borders, with open hearts and united purpose. Let us act now – together – to make mental well-being the cornerstone of our shared future.” France has declared mental health its “Grande cause” for 2025, affirming it as a national priority and calling for a collective response across all sectors. Dr Yannick Neuder, Minister of Health and Access to Care, shared, “France is proud to host this landmark summit and to lead by example in making mental health a national cause. We believe that no lasting progress can be achieved without breaking silos between sectors. Mental health must be a shared responsibility – embedded in our schools, our workplaces, our communities and every level of government. With this summit, we are sending a clear message: mental health belongs at the heart of all public policies.”'),
  
  ];
}

class ArticleModel {
  final String title;
  final String body;
  final String image;
  ArticleModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

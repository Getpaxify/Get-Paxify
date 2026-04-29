import 'package:get/get.dart';
import 'package:paxify/model/countries_model.dart';

class SignUpState {
  SignUpState();
  List<String> option = ['Email', 'Phone number'];
  List<String> gender = ['Male', 'Female'];
  List<String> country = ['Nigeria', 'Ghana','Togo','South Africa','Kenya','Rwanda','Uganda','Niger'];
  RxInt selectedIndex = 0.obs;
    RxString selectedGender = ''.obs;
        Rxn<CountryData> selectedCountry = Rxn<CountryData>(null);
  RxBool groupValue = false.obs;
  RxBool isFilled = false.obs;
  RxBool isLoginFilled = false.obs;
  RxBool isObscure = false.obs;
  RxBool isCObscure = false.obs;
    RxBool isFilledAssessment = false.obs;
    RxBool isLoading = false.obs;
        RxBool isBiometric = false.obs;
    RxList<CountryData> countries =
      RxList<CountryData>.from([]);
          RxList<CountryData> searchedCountry =
      RxList<CountryData>.from([]);
}

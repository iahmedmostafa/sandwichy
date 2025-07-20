import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices{

 static late SharedPreferences sharedPreferences;

 static initializeSharedPreferencesStorage()async {
   sharedPreferences=await SharedPreferences.getInstance();
  }

  static bool isFirstTime(){
   bool firstTime=sharedPreferences.getBool("isFirstTime")?? true;
   return firstTime;
  }
  static setFirstTimeWithFalse()async{
    bool firstTime=await sharedPreferences.setBool("isFirstTime",false);
  }

}
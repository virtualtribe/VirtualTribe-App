import 'package:virtualtribe/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//******** FOR DEVELOPER LOGICAL FUNCTION CREATED HIMSELF, */
class CustomFunction{

saveEmailANDSession({String email, String sesscode})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString(Constants.email, email);
         prefs.setString( Constants.sessCode,  sesscode);
  }

    
//EMAIL VALIDATOR
String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
}



}


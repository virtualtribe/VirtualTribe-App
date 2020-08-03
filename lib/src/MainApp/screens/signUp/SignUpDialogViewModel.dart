import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';


class SignUpDialogViewModel extends BaseViewModel{
 final NavigationService _navigationService = locator<NavigationService>();

  resendEmail(){

  }

  submit(){
    _navigationService.navigateToandRemove(dasbhoardRoute);
    
  }

}
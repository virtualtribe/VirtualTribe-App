import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/navigation_service.dart';
import 'package:virtualtribe/src/utils/constants.dart';


class SignUpDialogViewModel extends BaseViewModel{
 final NavigationService _navigationService = locator<NavigationService>();

  resendEmail(){

  }

  submit(){
    _navigationService.navigateToandRemove(dasbhoardRoute);
    
  }

}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class DynamicLinkService {
  
final NavigationService _navigationService = locator<NavigationService>();

    Future handleDynamicLinks() async {
      print('Dynamic Link is here for initialize');
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    // 2. handle link that has been retrieved
    _handleDeepLink(data);

    // 3. Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      // 3a. handle link that has been retrieved
      print('***************************Have Retried the Data');
      _handleDeepLink(dynamicLink);

    }, onError: (OnLinkErrorException e) async {
      print('***************************Link Failed: ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    
  if (deepLink != null) {
   //After getting link, Automatically goto verification link.
        if (deepLink != null) {
      _navigationService.navigateToandRemove(signInwithEmailLOADERRoute, arguments: deepLink);
    }
  }
  }

 

}
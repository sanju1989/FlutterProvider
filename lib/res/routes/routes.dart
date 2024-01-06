import 'package:get/get.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/view/dialogs/logoutdialog.dart';
import 'package:skdoosh/view/event/democardview.dart';
// import 'package:skdoosh/utils/SettingScreen.dart';
import 'package:skdoosh/view/event/neweventclub.dart';
import 'package:skdoosh/view/event/neweventscreen.dart';
import 'package:skdoosh/view/event/eventrequest.dart';
import 'package:skdoosh/view/event/publishevent.dart';
import 'package:skdoosh/view/login/loginscreen.dart';
import 'package:skdoosh/view/otp/otpscreen.dart';
import 'package:skdoosh/view/otp/signupotp.dart';
import 'package:skdoosh/view/profile/editprofile.dart';
import 'package:skdoosh/view/profile/newprofile.dart';
import 'package:skdoosh/view/settings/personaldetails.dart';
import 'package:skdoosh/view/staff/editduties.dart';
import 'package:skdoosh/view/profile/createprofile.dart';
import 'package:skdoosh/view/profile/profilescreen.dart';
import 'package:skdoosh/view/settings/About.dart';
import 'package:skdoosh/view/settings/Account.dart';
import 'package:skdoosh/view/settings/ManageNotification.dart';
import 'package:skdoosh/view/settings/SettingScreen.dart';
import 'package:skdoosh/view/event/neweventscreen.dart';
import 'package:skdoosh/view/login/loginscreen.dart';
import 'package:skdoosh/view/otp/otpscreen.dart';
import 'package:skdoosh/view/settings/SocailMedia.dart';
import 'package:skdoosh/view/signup/signupscreen.dart';
import 'package:skdoosh/view/splashscreen.dart';
import 'package:skdoosh/view/staff/CreateSupervisor.dart';
import 'package:skdoosh/view/staff/StaffScreen.dart';
import 'package:skdoosh/view/staff/supervisorsearchview.dart';
import 'package:skdoosh/view/tickets/createticketscategories.dart';
import 'package:skdoosh/view/venue/bankingvenuescreen.dart';
import 'package:skdoosh/view/venue/kycvenuescreen.dart';
import 'package:skdoosh/view/venue/venuedetails.dart';
import 'package:skdoosh/view/venue/venuescreen.dart';
import 'package:skdoosh/view/webview/termscondition.dart';
import 'package:skdoosh/view/welcomescreen.dart';
import '../../utils/calendar/CalendarScreen.dart';
import '../../view/home/MainScreen.dart';
import '../../view/settings/Help.dart';
import '../../view/staff/AllStaffStarScreen.dart';
import '../../view/tickets/ticketscreen.dart';
import '../../view/venue/veribusinesskyc.dart';


class AppRoutes {
  static appRoutes() => [

        GetPage(name: RouteName.splashScreen, page: () => Splash()),
       // GetPage(name: RouteName.splashScreen, page: () => VerifyBusinessKyc('Owner')),
        GetPage(name: RouteName.welcomeScreen, page: () => WelcomeScreen()),
        GetPage(name: RouteName.loginScreen, page: () => LoginScreen()),
        //GetPage(name: RouteName.signupScreen, page: () => Signupscreen()),
      //  GetPage(name: RouteName.otpScreen, page: () => Otpscreen()),
        GetPage(name: RouteName.termsConditionScreen, page: () => TermsCondition()),
        GetPage(name: RouteName.venuScreen, page: () => VenueScreen()),
        //GetPage(name: RouteName.venuedetails, page: () => VenueDetails()),
        //GetPage(name: RouteName.kycvenuescreen, page: () => KycVenueScreen()),
        //GetPage(name: RouteName.bankingvenuescreen, page: () => BankingVenueScreen()),
         GetPage(name: RouteName.createVenuDetailScreen, page: () => VenueDetails()),
         GetPage(name: RouteName.createVenuKycScreen, page: () => KycVenueScreen()),
         GetPage(name: RouteName.createVenuBankScreen, page: () => BankingVenueScreen()),
        GetPage(name: RouteName.createEvent, page: () => NewEventScreen()),
        GetPage(name: RouteName.mainScreen, page: () => MainScreen()),
        GetPage(name: RouteName.settingScreen, page: () => SettingScreen()),
        GetPage(name: RouteName.accountScreen, page: () => AccountScreen()),
        GetPage(name: RouteName.manageNotification, page: () => ManageNotification()),
        GetPage(name: RouteName.socialMediaScreen, page: () => SocialMedia()),
        GetPage(name: RouteName.aboutScreen, page: () => About()),
        GetPage(name: RouteName.helpScreen, page: () => Help()),
        GetPage(name: RouteName.staffScreen, page: () => StaffScreen()),
        GetPage(name: RouteName.createSupervisor, page: () => CreateSupervisor()),
        GetPage(name: RouteName.allStaffScreen, page: () => AllStaffStarScreen()),
        GetPage(name: RouteName.neweventclub, page: () => NewEventClub()),
        GetPage(name: RouteName.democardview, page: () => DraftedEvents()),
        GetPage(name: RouteName.eventrequest, page: () => EventRequest()),
        GetPage(name: RouteName.profilescreen, page: () => ProfileScreen()),
        GetPage(name: RouteName.createprofilescreen, page: () => CreateProfileScreen()),
        GetPage(name: RouteName.editduties, page: () => EditDutiesScreen()),
        GetPage(name: RouteName.editprofilescreen, page: () => EditProfileScreen()),
        GetPage(name: RouteName.calendarScreen, page: () => CalendarScreen()),
        GetPage(name: RouteName.supervisorscreen, page: () => SupervisorScreen()),
        GetPage(name: RouteName.newprofile, page: () => NewProfile()),
        GetPage(name: RouteName.publishevent, page: () => PublishEvents()),
       // GetPage(name: RouteName.signupotp, page: () => SignupOtp()),
        GetPage(name: RouteName.ticketscreen, page: () => TicketScreen()),
        GetPage(name: RouteName.createticket, page: () => CreateTicket()),
        GetPage(name: RouteName.personalDetails, page: () => PersonalDetailScreen()),

      ];
}

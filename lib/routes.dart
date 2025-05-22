import 'package:get/get.dart';
import 'package:my_project/Model/My%20Middle%20Ware/My_Middle_Ware_Model.dart';
import 'Features/Choose_departmant/Screen/View/ChooseDepartmentView.dart';
import 'Features/Doctor Login/Screen/View/Doctor_Login_View.dart';
import 'Features/Main Screen Doctor/Screen/View/Doctor_Profile_View.dart';
import 'Features/Main Screen Doctor/Screen/View/Main_Screen_Doctors_View.dart';
import 'Features/Main Screen Student/Bottom_Nativaction_Bar/Screen/View/BottomNavigationBarView.dart';
import 'Features/Main Screen Student/Student Home Screen/Screen/View/Student_Profile_View.dart';
import 'Features/OnBoarding/Screen/View/OnBoarding_View.dart';
import 'Features/Splash Screen/Screen/View/Splash_Screen_View.dart';
import 'Features/Student Login/Screen/View/Student_Login_View.dart';
import 'Model/App Routes/App_Route_Model.dart';

List<GetPage<dynamic>>? routes = [

  GetPage(name: "/", page: () => SplashScreenView()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoardingView() , middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.chooseDepartment, page: () => const ChooseDepartmentView()),
  GetPage(name: AppRoute.studentLogin, page: () => const StudentLoginView() , middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.doctorLogin, page: () => const DoctorLoginView() , middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.bottomNativactionBarView, page: () =>  const BottomNavigationBarView()),
  GetPage(name: AppRoute.mainScreenDoctorsView, page: () => const MainScreenDoctorsView()),
  GetPage(name: AppRoute.studentProfileView, page: () => const StudentProfileView()),
  GetPage(name: AppRoute.doctorProfileView, page: () => const DoctorProfileView()),

];
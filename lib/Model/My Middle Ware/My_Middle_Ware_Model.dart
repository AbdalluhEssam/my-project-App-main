import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../App Routes/App_Route_Model.dart';
import '../My Services/My_Services_Model.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final myServices = Get.find<MyServices>();

    bool isOnboardingCompleted =
        myServices.sharedPreferences.getString("onboarding") == "1";
    bool isLoggedIn =
        myServices.sharedPreferences.getBool("isLoggedIn") ?? false;
    String? userType = myServices.sharedPreferences.getString("userType");

    print("AuthMiddleware: isOnboardingCompleted = $isOnboardingCompleted, isLoggedIn = $isLoggedIn, userType = $userType");

    if (!isOnboardingCompleted) {
      return route == AppRoute.onBoarding
          ? null
          : const RouteSettings(name: AppRoute.onBoarding);
    }

    if (isOnboardingCompleted && userType == null) {
      return route == AppRoute.chooseDepartment
          ? null
          : const RouteSettings(name: AppRoute.chooseDepartment);
    }

    if (userType == "student" && isLoggedIn == true && isOnboardingCompleted == true){
      return route == AppRoute.chooseDepartment
          ? null
          : const RouteSettings(name: AppRoute.bottomNativactionBarView);
    } else if(userType == "doctor" && isLoggedIn == true && isOnboardingCompleted == true){
      return route == AppRoute.chooseDepartment
          ? null
          : const RouteSettings(name: AppRoute.mainScreenDoctorsView);
    }

    if (userType == "student" && isLoggedIn == true) {
      return route == AppRoute.studentLogin
          ? const RouteSettings(name: AppRoute.bottomNativactionBarView)
          : const RouteSettings(name: AppRoute.chooseDepartment);
    } else if (userType == "doctor" && isLoggedIn == true) {
      return route == AppRoute.doctorLogin
          ? const RouteSettings(name: AppRoute.mainScreenDoctorsView)
          : const RouteSettings(name: AppRoute.chooseDepartment);
    }

    if (userType == "student" && isLoggedIn == false && isOnboardingCompleted == true){
      return route == AppRoute.studentLogin
          ? null
          : const RouteSettings(name: AppRoute.chooseDepartment);
    } else if(userType == "doctor" && isLoggedIn == false && isOnboardingCompleted == true){
      return route == AppRoute.doctorLogin
          ? null
          : const RouteSettings(name: AppRoute.chooseDepartment);
    }

    return null;
  }
}


// class MyMiddleWare extends GetMiddleware {
//   @override
//   int? get priority => 1;
//
//   @override
//   RouteSettings? redirect(String? route) {
//     final myServices = Get.find<MyServices>();
//
//     // ✅ استرجاع البيانات من SharedPreferences
//     bool isOnboardingCompleted =
//         myServices.sharedPreferences.getString("onboarding") == "1";
//     bool isLoggedIn =
//         myServices.sharedPreferences.getBool("isLoggedIn") ?? false;
//
//     // ✅ استرجاع نوع المستخدم: "student" أو "doctor"
//     String? userType = myServices.sharedPreferences.getString("userType");
//
//     print(
//         "AuthMiddleware: isOnboardingCompleted = $isOnboardingCompleted, isLoggedIn = $isLoggedIn, userType = $userType");
//
//     // ✅ 1️⃣ إذا لم يُكمل المستخدم `onBoarding`، يبقى فيها
//     if (!isOnboardingCompleted) {
//       return route == AppRoute.onBoarding
//           ? null
//           : const RouteSettings(name: AppRoute.onBoarding);
//     }
//
//     // ✅ 2️⃣ إذا أنهى `onBoarding`، يذهب إلى `chooseDepartment`
//     if (isOnboardingCompleted && !isLoggedIn) {
//       return route == AppRoute.chooseDepartment
//           ? null
//           : const RouteSettings(name: AppRoute.chooseDepartment);
//     }
//
//     // ✅ 3️⃣ إذا قام المستخدم بتسجيل الدخول بعد `chooseDepartment`، يتم حفظ حالته
//     if (isLoggedIn) {
//       if (userType == "student") {
//         return route == AppRoute.studentLogin
//             ? const RouteSettings(name: AppRoute.bottomNativactionBarView)//////////////
//             : null;
//       } else if (userType == "doctor") {
//         return route == AppRoute.doctorLogin
//             ? const RouteSettings(name: AppRoute.mainScreenDoctorsView)/////////////////
//             : null;
//       }
//     }
//
//     // ✅ 4️⃣ إذا لم يكن مسجل دخول، يحدد صفحة تسجيل الدخول المناسبة
//     if (!isLoggedIn) {
//       return userType == "doctor"
//           ? const RouteSettings(name: AppRoute.doctorLogin)
//           : const RouteSettings(name: AppRoute.studentLogin);
//     }
//
//     return null; // السماح بالوصول إلى الصفحة المطلوبة
//   }
// }


// class MyMiddleWare extends GetMiddleware {
//   @override
//   int? get priority => 1;
//
//   @override
//   RouteSettings? redirect(String? route) {
//     final myServices = Get.find<MyServices>();
//
//     // ✅ استرجاع البيانات من SharedPreferences
//     bool isOnboardingCompleted =
//         myServices.sharedPreferences.getString("onboarding") == "1";
//     bool isLoggedIn =
//         myServices.sharedPreferences.getBool("isLoggedIn") ?? false;
//
//     print(
//         "AuthMiddleware: isOnboardingCompleted = $isOnboardingCompleted , isLoggedIn = $isLoggedIn");
//
//     // ✅ 1️⃣ إذا لم يُكمل المستخدم `onBoarding`، يبقى فيها
//     if (!isOnboardingCompleted) {
//       return route == AppRoute.onBoarding
//           ? null
//           : const RouteSettings(name: AppRoute.onBoarding);
//     }
//
//     // ✅ 2️⃣ إذا أنهى `onBoarding`، يذهب إلى `chooseDepartment`
//     if (isOnboardingCompleted && !isLoggedIn) {
//       return route == AppRoute.chooseDepartment
//           ? null
//           : const RouteSettings(name: AppRoute.chooseDepartment);
//     }
//
//     // ✅ 3️⃣ إذا قام المستخدم بتسجيل الدخول بعد `chooseDepartment`، يتم حفظ الحالة
//     if (isLoggedIn) {
//       return route == AppRoute.studentLogin
//           ? const RouteSettings(name: AppRoute.onBoarding) ///////////////////////
//           : null;
//     }
//
//     // ✅ 4️⃣ إذا لم يكن مسجل دخول ويريد الدخول إلى التطبيق، يرجع إلى `studentLogin`
//     return !isLoggedIn
//         ? const RouteSettings(name: AppRoute.studentLogin)
//         : null;
//   }
// }




// class MyMiddleWare extends GetMiddleware {
//   @override
//   int? get priority => 1;
//
//   @override
//   RouteSettings? redirect(String? route) {
//     final myServices = Get.find<MyServices>();
//
//     // Check if the onboarding flag is set
//     bool isOnboardingCompleted =
//         myServices.sharedPreferences.getString("onboarding") == "1";
//
//     // Check if the user is logged in
//     bool isLoggedIn = myServices.isLoggedIn();
//
//     // Check if the user is signed up
//     // bool isSignedUp = myServices.isSignedUp();
//
//     // Debugging logs
//     print(
//         "AuthMiddleware: Checking status - isLoggedIn: $isLoggedIn, isOnboardingCompleted: $isOnboardingCompleted");
//
//     // Onboarding logic: If onboarding is completed, redirect to Login, otherwise stay on Onboarding
//     if (route == AppRoute.onBoarding && isOnboardingCompleted) {
//       return const RouteSettings(name: AppRoute.chooseDepartment);
//     }
//
//     // If user is logged in and tries to go to the sign-in or sign-up route, redirect to BottomNavigationBar
//     if (isLoggedIn) {
//       if (route == AppRoute.studentLogin) {
//         return const RouteSettings(name: AppRoute.onBoarding);
//       }
//     }
//     // If user is not logged in and tries to go to BottomNavigationBar, redirect to Login
//     else {
//       if (route == AppRoute.onBoarding) {
//         return const RouteSettings(name: AppRoute.studentLogin);
//       }
//     }
//
//     // If user is not signed up and tries to access BottomNavigationBar, redirect to SignUp
//     // if (!isSignedUp && route == AppRoute.BottomNavigationBar) {
//     //   return const RouteSettings(name: AppRoute.SignUp);
//     // }
//
//     // Allow access to the requested route
//     return null;
//   }
// }
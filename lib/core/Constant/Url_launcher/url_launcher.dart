import 'package:get/get.dart';
import 'package:my_project/core/Constant/SnackBar/Snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherController extends GetxController {
  final SnackbarService snackbarService = SnackbarService();

  // ✅ فتح أي رابط
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      snackbarService.showSnackbar(
        message: " تعذر فتح الرابط : $url",
        mainTitle: "خطأ",
      );
    }
  }

  // ✅ فتح واتساب برقم معين
  Future<void> openWhatsApp(String phone) async {
    String url = "https://wa.me/$phone";
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      snackbarService.showSnackbar(
        message: "تعذر فتح واتساب",
        mainTitle: "خطأ",
      );
    }
  }

  // ✅ فتح تطبيق Google Maps بموقع معين
  Future<void> openGoogleMaps(double lat, double lng) async {
    String url = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      snackbarService.showSnackbar(
        message: "تعذر فتح خرائط جوجل",
        mainTitle: "خطأ",
      );
    }
  }
}

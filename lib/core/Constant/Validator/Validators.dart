validatorInput(
    String val,
    // int min,
    // int max,
    String type,
    {String? password}) {
  final RegExp startsWithLetterRegExp = RegExp(r'^[a-zA-Z]');
  final RegExp noSpacesRegExp = RegExp(r'^\S+$');
  final RegExp validCharactersRegExp = RegExp(r'^[a-zA-Z0-9_-]+$');
  final RegExp emailRegExp = RegExp(r'^[a-zA-Z].*$');
  const int minLengthName = 3;
  const int maxLengthName = 255;
  const int maxLengthEmail = 255;
  const int minLengthPhone = 10;
  const int minLengthPassword = 6;
  const int minLengthConfirmPassword = 8;

  if (type == "code") {
    if (val.isEmpty) {
      return 'يجب إدخال كود الطالب';
    }
  }

  if (type == "code_doctor") {
    if (val.isEmpty) {
      return 'يجب إدخال كود الدكتور';
    }
  }

  if (type == "pass") {
    if (val.isEmpty) {
      return "يجب إدخال الرقم السري";
    }
  }
}

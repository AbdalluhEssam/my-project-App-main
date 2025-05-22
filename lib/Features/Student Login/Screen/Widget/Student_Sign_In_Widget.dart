import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/Constant/Colors/Colors.dart';
import '../../../../core/Constant/Fonts/Fonts.dart';

class CustomTextFormField extends StatefulWidget {
  //final String titleOfTextFormField;
  final String hintText;
  final IconData? iconOfTextFormField;

  //final Widget? suffixIcon;
  final TextInputType keyboardType;

  // final String? Function(String?) onChanged;
  final TextEditingController myController;
  final String? Function(String?) validator;

  const CustomTextFormField(
      {super.key,
      //required this.titleOfTextFormField,
      required this.hintText,
      this.iconOfTextFormField,
      //this.suffixIcon,
      //required this.onChanged,
      required this.myController,
      required this.validator,
      required this.keyboardType});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SizedBox(
            width: Get.width,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: _focusNode,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                //onChanged: widget.onChanged,
                controller: widget.myController,
                style: mediumGreyColor,
                cursorColor: orangeColor,
                cursorOpacityAnimates: true,
                decoration: InputDecoration(
                  prefixIcon: widget.iconOfTextFormField != null
                      ? Icon(widget.iconOfTextFormField,
                          color: isFocused ? orangeColor : greyColor, size: 22)
                      : null,
                  // prefixIcon: Icon(widget.iconOfTextFormField,
                  //     color: greyColor, size: 22),
                  prefixIconColor: blackColor,
                  //suffixIcon: widget.suffixIcon,
                  hintText: widget.hintText,
                  hintStyle: smallGreyColor,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: orangeColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: orangeColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: orangeColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class CustomTextFormFieldPassword extends StatefulWidget {
  //final String titleOfTextFormField;
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?) validator;

  const CustomTextFormFieldPassword(
      {super.key,
      //required this.titleOfTextFormField,
      required this.hintText,
      required this.myController,
      required this.validator});

  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool iconEye = true;
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SizedBox(
            width: Get.width,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.number,
                validator: widget.validator,
                controller: widget.myController,
                obscureText: iconEye,
                style: mediumGreyColor,
                cursorColor: orangeColor,
                cursorOpacityAnimates: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    size: 20,
                    color: isFocused ? orangeColor : greyColor,
                  ),
                  prefixIconColor: blackColor,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        iconEye = !iconEye;
                      });
                    },
                    icon: iconEye
                        ? Icon(
                            Icons.visibility_off_outlined,
                            //size: 30,
                            color: isFocused ? orangeColor : greyColor,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            //size: 30,
                            color: isFocused ? orangeColor : greyColor,
                          ),
                  ),
                  hintText: widget.hintText,
                  hintStyle: smallGreyColor,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: orangeColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: orangeColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: orangeColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:rimotech/constants/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle textFormFieldStyle;
  final TextStyle hintTextStyle;
  final TextStyle labelTextStyle;
  final TextAlign textAlign;
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final String prefixText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor, labelColor;
  final Color fillColor;
  final bool filled;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final int maxLength;
  final bool maxLengthEnforced;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final String label;
  final bool readOnly, enabled;

  CustomTextFormField(
      {this.prefixIcon,
      this.suffixIcon,
      this.textFormFieldStyle =
          const TextStyle(fontSize: 12, color: AppColors.black),
      this.textAlign = TextAlign.start,
      this.hintTextStyle,
      this.borderStyle = BorderStyle.none,
      this.borderRadius = 8,
      this.borderWidth = 1.5,
      this.contentPaddingHorizontal = 5,
      this.contentPaddingVertical = 0,
      this.hintText,
      this.labelTextStyle,
      this.borderColor = AppColors.primaryColor,
      this.focusedBorderColor = AppColors.primaryColor,
      this.enabledBorderColor = AppColors.primaryColor,
      this.fillColor = AppColors.white,
      this.filled = true,
      this.hasPrefixIcon = false,
      this.hasSuffixIcon = false,
      this.obscured = false,
      this.textInputType,
      this.enabled,
      this.readOnly,
      this.onChanged,
      this.prefixText,
      this.maxLength,
      this.maxLengthEnforced = false,
      this.validator,
      this.inputFormatters,
      this.controller,
      this.label,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: kwidth(80, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[400])),
      child: TextFormField(
        readOnly: readOnly ?? false,
        enabled: enabled,
        controller: controller,
        style: textFormFieldStyle,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        onChanged: onChanged,
        maxLength: maxLength,
        // maxLengthEnforcement: MaxLengthEnforcement.none,
        validator: validator,
        textAlign: textAlign,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: borderWidth,
              style: borderStyle,
            ),
          ),
          prefixText: prefixText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: enabledBorderColor,
              width: borderWidth,
              style: borderStyle,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: focusedBorderColor,
              width: borderWidth,
              style: borderStyle,
            ),
          ),
          prefixIcon: hasPrefixIcon ? prefixIcon : null,
          suffixIcon: hasSuffixIcon ? suffixIcon : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: kwidth(contentPaddingHorizontal, context),
            vertical: kheight(contentPaddingVertical, context),
          ),
          labelText: label,
          labelStyle: labelTextStyle,
          hintText: hintText,
          hintStyle: hintTextStyle,
          filled: filled,
          fillColor: fillColor,
        ),
        obscureText: obscured,
      ),
    );
  }
}

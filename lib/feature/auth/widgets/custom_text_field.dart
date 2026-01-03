import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool enabled;
  final FocusNode? focusNode;
  final bool isRequired;

  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.maxLines = 1,
    this.enabled = true,
    this.focusNode,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      enabled: enabled,
      focusNode: focusNode,
      style: TextStyle(
        fontSize: Dimensions.fontSizeDefault,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: Dimensions.fontSizeDefault,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor.withOpacity(0.5),
          fontSize: Dimensions.fontSizeDefault,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Theme.of(context).cardColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: prefixIcon != null ? Dimensions.paddingSizeSmall : Dimensions.paddingSizeMedium,
          vertical: Dimensions.paddingSizeMedium,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

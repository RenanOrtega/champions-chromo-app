import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    String digitsOnly = text.replaceAll(RegExp(r'\D'), '');
    
    String formattedText;

    if (digitsOnly.length <= 2) {
      formattedText = '($digitsOnly';
    } else if (digitsOnly.length <= 7) {
      formattedText = '(${digitsOnly.substring(0, 2)}) ${digitsOnly.substring(2)}';
    } else if (digitsOnly.length <= 11) {
      formattedText = '(${digitsOnly.substring(0, 2)}) ${digitsOnly.substring(2, 7)}-${digitsOnly.substring(7)}';
    } else {
      // Truncate to maximum length of Brazilian phone number
      digitsOnly = digitsOnly.substring(0, 11);
      formattedText = '(${digitsOnly.substring(0, 2)}) ${digitsOnly.substring(2, 7)}-${digitsOnly.substring(7)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
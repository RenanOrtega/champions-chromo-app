import 'package:flutter/services.dart';

class CPFInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    
    if (text.isEmpty) {
      return newValue;
    }
    
    // Remove all non-digit characters
    String digitsOnly = text.replaceAll(RegExp(r'\D'), '');
    
    String formattedText;
    if (digitsOnly.length <= 3) {
      formattedText = digitsOnly;
    } else if (digitsOnly.length <= 6) {
      formattedText = '${digitsOnly.substring(0, 3)}.${digitsOnly.substring(3)}';
    } else if (digitsOnly.length <= 9) {
      formattedText = '${digitsOnly.substring(0, 3)}.${digitsOnly.substring(3, 6)}.${digitsOnly.substring(6)}';
    } else {
      // Format as CPF: 000.000.000-00
      if (digitsOnly.length > 11) {
        digitsOnly = digitsOnly.substring(0, 11);
      }
      
      formattedText = '${digitsOnly.substring(0, 3)}.${digitsOnly.substring(3, 6)}.${digitsOnly.substring(6, 9)}';
      
      if (digitsOnly.length > 9) {
        formattedText += '-${digitsOnly.substring(9)}';
      }
    }
    
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
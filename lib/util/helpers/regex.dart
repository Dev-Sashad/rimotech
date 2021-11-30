final bool Function(String) emailRegEx = (String emailText) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailText);
};

final bool Function(String) emailorphoneRegEx = (String text) {
  return emailRegEx(text);
};

final bool Function(String) passwordRegEx = (String password) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(password);
};

final bool Function(String) phoneRegEx = (String phone) {
  return RegExp(r"(^[\+]?[234]\d{12}$)").hasMatch(phone);
};

String Function(String) phoneVal = (val) {
  if (val.isEmpty || val.length != 11) {
    return 'enter valid phone number';
  }

  // else if (phoneRegEx(val) && val.length == 14)
  else
    return null;

  // else {
  //   return 'example +234802010300';
  // }
};

String Function(String) emailVal = (val) {
  if (val.isEmpty) {
    return 'enter your email';
  } else if (emailRegEx(val)) {
    return null;
  } else {
    return 'enter a valid email';
  }
};

String Function(String) passwordVal = (val) {
  if (val.isEmpty || val.length < 8) {
    return 'password should contain 8 cha';
  } else {
    return null;
  }
};

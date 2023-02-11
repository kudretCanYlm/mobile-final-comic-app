String? NotNullValidator(String? value, String textName) {
  if (value != null) {
    if (value.isEmpty) {
      return 'Please enter $textName';
    }
    return null;
  }
  return "Error";
}

String? LengthValidator(String? value, int minLength, int maxLength) {
  if (value!.length >= minLength &&
      value.length <= maxLength &&
      value != null) {
    return null;
  }
  return 'length must be between $minLength - $maxLength';
}

String? EmailValitador(String? value) {
  if (value != null) {
    if (!value.isEmpty) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if (emailValid) {
        return null;
      }
    }

    return "Please enter email";
  }
  return "Error";
}

String? PasswordValidador(String? value) {
  if (value != null) {
    if (!value.isEmpty) {
      if (value.length >= 6 && value.length <= 50) {
        return null;
      }
      return "Password length must be between 6-50";
    }

    return "Please enter password";
  }
  return "Error";
}

String? PasswordValidadorDoubleCheck(String? value, String? prevValue) {
  if (value != prevValue) {
    return "passwords don't match";
  }
  return null;
}

String? PhoneValidador(String? value) {
  String pattern =
      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
  RegExp regExp = new RegExp(pattern);
  if (value!.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value!)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

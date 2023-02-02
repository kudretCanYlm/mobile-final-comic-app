String? NotNullValidator(String? value, String textName) {
  if (value != null) {
    if (value.isEmpty) {
      return 'Please enter $textName';
    }
    return null;
  }
  return "Error";
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

String? PasswordValitador(String? value) {
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

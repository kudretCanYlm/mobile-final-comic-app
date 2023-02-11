class SignUpModel {
  String Email;
  String Password;

  SignUpModel(this.Email, this.Password);

  setEmail(value) {
    this.Email = value;
  }

  setPassword(value) {
    this.Password = value;
  }
}

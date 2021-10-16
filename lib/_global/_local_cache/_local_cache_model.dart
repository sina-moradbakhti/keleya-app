class LocalCacheModel {
  String? uid;
  bool isUserLoggedIn = false;
  String? token;
  String? email;
  String? name;
  String? babyBirthDate;
  bool? onboardingDone;
  String? password;

  LocalCacheModel(
      {this.isUserLoggedIn = false,
      this.email,
      this.password,
      this.uid,
      this.name,
      this.token,
      this.babyBirthDate,
      this.onboardingDone});
}

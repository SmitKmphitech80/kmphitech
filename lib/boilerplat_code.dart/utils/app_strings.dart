import 'package:kmphitech/constants.dart';

void addString() => addData(
      path: "$utilsPath/app_strings.dart",
      content: '''
class AppStrings {
  static const String appName = "AppName";

  /// auth strings
  static const String signIn = "Sign In";
  static const String signUp = "Sign Up";
  static const String pass = "Password";
  static const String enterPass = "Enter password";
  static const String enterNPass = "Enter new password";
  static const String enterCuPass = "Enter current password";
  static const String enterCPass = "Enter confirm password";
  static const String enterUser = "Enter username";
  static const String forgetPass = "Forgot Password?";
  static const String enterEmail = "Enter email";
  static const String createAcc = "Create a New Account";
  static const String email = "Email";
  static const String pleaseSing = "Please Sign In to continue";
  static const String sendCode = "SEND CODE";
  static const String otpVerification = "OTP Authentication";
  static const String codeHasSent = "Code was sent to your email";
  static const String resentCode = "Resend Code";
  static const String verifyCode = "VERIFY CODE";
  static const String yourPassReset = "Your password has been reset.";
  static const String ok = "OK";
  static const String userName = "Username";
  static const String iAgree = "I agree to ";
  static const String privacy = "Privacy Policy";
  static const String myPremiumPlan = "My Premium Plan";
  static const String terms = "Terms & Conditions";
  static const String already = "Already have an account? ";
  static const String congrats = "Congratulation";
  static const String youHaveSuccess =
      "You have successfully created your account.";
  static const String continues = "CONTINUE";
  static const String enterVerification =
      "Enter the verification code we just\\nsent to your email address.";
  static const String doNotHave = "Don’t have an account? ";
  static const String noWorries =
      "No worries, we will help you\\nto reset your password.";

  /// reset pass
  static const String resetPass = "RESET PASSWORD";
  static const String newPass = "New Password";
  static const String conPass = "Confirm Password";
  static const String setNew = "Set New Password";
  static const String yourNewPass =
      "Your new password must be different from previously used password.";

  /// contact us screen
  static const String enterSubject = "Enter your subject";
  static const String enterMessage = "Enter your message";

  /// setting screen strings
  static const String setting = "Settings";
  static const String editProfile = "Edit Profile";
  static const String setHistory = "Set History";
  static const String aboutUs = "About Us";
  static const String contactUs = "Contact Us";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsNCondition = "Terms & Conditions";
  static const String deleteAcc = "Delete Account";
  static const String singOut = "Sign Out";
  static const String changePass = "Change Password";
  static const String save = "SAVE";
  static const String profileUpdated = "Profile Updated";
  static const String currentPass = "Current Password";
  static const String passChanged = "Password Changed";
  static const String passChangeSuccess =
      "Your password has been changed successfully.";
  static const String youHaveSuccessUpdate =
      "You have successfully updated your profile information.";

  /// error text
  static const String enterName = "Please enter your user name";
  static const String enterEmailErr = "Please enter your email";
  static const String enterPhone = "Please enter your phone number";
  static const String enterValidPhone = "Please enter valid phone number";
  static const String enterValidEmail = "Please enter valid email address";
  static const String enterPassword = "Please enter your password";
  static const String enterCuPassword = "Please enter your current password";
  static const String incorrectPass = "Password is incorrect";
  static const String enterOtp = "Please enter OTP";
  static const String enterNewPass = "Please enter new Password";
  static const String enterConPass = "Please enter confirm Password";
  static const String conPassAtLeast =
      "Confirm password must be at least 6 characters";
  static const String passAtLeast = "Password must be at least 6 characters";
  static const String passNotSame =
      "Password and confirm password does not match";
  static const String acceptPrivacy =
      "Please accept privacy policy and terms & conditions";
  static const String enterMsg = "Please enter message";
  static const String enterSub = "Please enter subject";
}

''',
    );
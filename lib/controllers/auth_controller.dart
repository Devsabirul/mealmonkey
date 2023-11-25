import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/models/user_model.dart';
import 'package:mealmonkey/views/screens/main_screen.dart';
import 'package:mealmonkey/views/screens/wellcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFormFieldController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailFieldController = TextEditingController();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController mobileNumberFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController confirmPasswordFieldController =
      TextEditingController();

  clearLoginForm() {
    emailFieldController.clear();
    passwordFieldController.clear();
  }

  clearSignUpForm() {
    emailFieldController.clear();
    passwordFieldController.clear();
    nameFieldController.clear();
    addressFieldController.clear();
    mobileNumberFieldController.clear();
  }

  signup() async {
    isLoading.value = true;
    await _auth
        .createUserWithEmailAndPassword(
            email: emailFieldController.text,
            password: passwordFieldController.text)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      isLoading.value = false;
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore() async {
    // calling firestore
    // calling user model
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // write all the values

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameFieldController.text.toString();
    userModel.mobileNumber = mobileNumberFieldController.text.toString();
    userModel.address = addressFieldController.text.toString();

    await firebaseFirestore
        .collection("user")
        .doc(user.uid)
        .set(userModel.toMap());
    clearSignUpForm();
    isLoading.value = false;
    Fluttertoast.showToast(msg: "Account created successfully");
    Get.off(const MainScreen(), transition: Transition.rightToLeft);
  }

  // login with firebase
  login() async {
    isLoading.value = true;
    await _auth
        .signInWithEmailAndPassword(
            email: emailFieldController.text,
            password: passwordFieldController.text)
        .then((value) => {
              clearLoginForm(),
              isLoading.value = false,
              Fluttertoast.showToast(msg: "Login Successfully."),
              Get.off(const MainScreen(), transition: Transition.rightToLeft)
            })
        .catchError((e) {
      isLoading.value = false;
      Fluttertoast.showToast(msg: e!.message);
    });
  }
  // end login
  // save login info

  saveLoginInfo() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
  }

  getIsLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    var loginValue = prefs.getBool("isLoggedIn");
    isLoggedIn.value = loginValue ?? false;
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("isLoggedIn");
    clearLoginForm();
    clearSignUpForm();
    Get.offAll(const WellcomeScreen(), transition: Transition.rightToLeft);
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taskw3/utils/color.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  send() {
    var formdata = _formKey.currentState;

    if (formdata!.validate()) {
      print("Valid");
    }
  }

  bool notify = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.colorpremry,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(360),
            borderSide: BorderSide.none),
        onPressed: send,
        child: Icon(
          Icons.lock_open_rounded,
          color: AppColors.colorWhite,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.colorpremry,
        title: Text(
          "Sign iN",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.colorWhite),
        ),
        centerTitle: true,
        leading: Switch(
            activeColor: Colors.black,
            activeTrackColor: Colors.grey,
            value: notify,
            onChanged: (val) {
              setState(() {
                notify = val;
              });
              if (val == false) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
              log("ok");
            }),
      ),
      body: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            'assets/images/undraw_login_re_4vu2 (1).svg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Username cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    ));
  }
}

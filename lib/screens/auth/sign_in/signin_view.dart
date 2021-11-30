import 'package:flutter/material.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:rimotech/constants/size_config.dart';
import 'package:rimotech/core/models/login.dart';
import 'package:rimotech/screens/auth/sign_in/signin_viewmodel.dart';
import 'package:rimotech/util/helpers/helpers.dart';
import 'package:rimotech/util/helpers/regex.dart';
import 'package:rimotech/widgets/custom_button.dart';
import 'package:rimotech/widgets/custom_text_form_field.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool visiblePassword = false;
  bool _isValidated = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () {
          return null;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.primaryColor,
                body: Container(
                  width: kwidth(100, context),
                  height: kheight(100, context),
                  child: Stack(
                    children: [
                      Positioned(
                          top: kheight(5, context),
                          left: 20,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 24,
                              width: 24,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle),
                              child: Icon(Icons.arrow_back_ios, size: 15),
                            ),
                          )),
                      Positioned(
                          top: kheight(15, context),
                          left: 20,
                          child: Text('Welcome back, Bibi!',
                              style: TextStyle(
                                fontSize: 22,
                                //letterSpacing: 5,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ))),
                      Positioned(
                          top: kheight(22, context),
                          left: 20,
                          child: Text(
                              'Sign in to your Settl account and enjoy the',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: AppColors.white,
                              ))),
                      Positioned(
                          top: kheight(25, context),
                          left: 20,
                          child: Text('endless possibilities.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: AppColors.white,
                              ))),
                      Container(
                        height: kheight(60, context),
                        width: kwidth(100, context),
                        margin: EdgeInsets.only(
                          top: kheight(40, context),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Form(
                          key: _key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: () => setState(() =>
                              _isValidated = _key.currentState.validate()),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              customYMargin(20),
                              CustomTextFormField(
                                label: "Email",
                                textInputType: TextInputType.name,
                                controller: emailController,
                                validator: emailVal,
                                //onChanged: (input) => model.setUserName(input),
                              ),
                              CustomTextFormField(
                                label: "Password",
                                textInputType: TextInputType.visiblePassword,
                                obscured: visiblePassword,
                                controller: passwordController,
                                validator: passwordVal,
                                //onChanged: (input) => model.setPassword(input),
                              ),
                              customYMargin(kheight(8, context)),
                              CustomButton(
                                title: 'Sign In',
                                width: kwidth(100, context),
                                margin: 1,
                                online: true,
                                onPressed: () {
                                  if (_isValidated) {
                                    model.signIn(
                                        Login(
                                            email: emailController.text,
                                            password: passwordController.text),
                                        context);
                                    FocusScope.of(context).unfocus();
                                    _key.currentState.build(context);
                                  } else {
                                    showToast('fields can\'t be empty');
                                  }
                                },
                              ),
                              customYMargin(kheight(4, context)),
                              InkWell(
                                onTap: () {
                                  showToast(
                                      'forgot password page is not in the design');
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              customYMargin(kheight(3, context)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\’t have a Settl account?',
                                    style: TextStyle(
                                        color: AppColors.black, fontSize: 14),
                                  ),
                                  customXMargin(3),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Create an account',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

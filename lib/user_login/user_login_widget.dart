import '../auth/auth_util.dart';
import '../code_verification/code_verification_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLoginWidget extends StatefulWidget {
  const UserLoginWidget({Key key}) : super(key: key);

  @override
  _UserLoginWidgetState createState() => _UserLoginWidgetState();
}

class _UserLoginWidgetState extends State<UserLoginWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  TextEditingController phoneNumberController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/logoipsum-logo-38.svg',
                    width: 180,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 4, 32, 4),
                      child: TextFormField(
                        controller: phoneNumberController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          prefixIcon: Icon(
                            Icons.phone_iphone,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 32,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32, 4, 32, 4),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (phoneNumberController.text.isEmpty ||
                        !phoneNumberController.text.startsWith('+')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Phone Number is required and has to start with +.'),
                        ),
                      );
                      return;
                    }
                    await beginPhoneAuth(
                      context: context,
                      phoneNumber: phoneNumberController.text,
                      onCodeSent: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CodeVerificationWidget(),
                          ),
                          (r) => false,
                        );
                      },
                    );
                  },
                  text: 'Login',
                  options: FFButtonOptions(
                    width: 50,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
              Spacer(flex: 2),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: emailTextController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: passwordTextController,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      final user = await createAccountWithEmail(
                        context,
                        emailTextController.text,
                        passwordTextController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'adsList'),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Button',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Oswald',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRegistrationWidget extends StatefulWidget {
  const UserRegistrationWidget({Key key}) : super(key: key);

  @override
  _UserRegistrationWidgetState createState() => _UserRegistrationWidgetState();
}

class _UserRegistrationWidgetState extends State<UserRegistrationWidget> {
  TextEditingController phoneNumberController1;
  TextEditingController phoneNumberController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController1 = TextEditingController();
    phoneNumberController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
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
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    fit: BoxFit.scaleDown,
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
                        controller: phoneNumberController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter country',
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
                          prefixIcon: FaIcon(
                            FontAwesomeIcons.globeEurope,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 32,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 4, 32, 4),
                      child: TextFormField(
                        controller: phoneNumberController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
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
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32, 4, 32, 4),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Login',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).linksbuttons,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 16,
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

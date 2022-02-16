import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeVerificationWidget extends StatefulWidget {
  const CodeVerificationWidget({Key key}) : super(key: key);

  @override
  _CodeVerificationWidgetState createState() => _CodeVerificationWidgetState();
}

class _CodeVerificationWidgetState extends State<CodeVerificationWidget> {
  TextEditingController smscodeController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    smscodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryColor),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 1,
      ),
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 16),
                    child: Text(
                      'Have you received SMS ?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Oswald',
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'smscodeController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            controller: smscodeController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter verification code from SMS',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                              prefixIcon: Icon(
                                Icons.verified_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                size: 32,
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Oswald',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Field is required';
                              }
                              if (val.length < 6) {
                                return 'Requires at least 6 characters.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (smscodeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Enter SMS verification code.'),
                            ),
                          );
                          return;
                        }
                        final phoneVerifiedUser = await verifySmsCode(
                          context: context,
                          smsCode: smscodeController.text,
                        );
                        if (phoneVerifiedUser == null) {
                          return;
                        }
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'List'),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).links,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Oswald',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              fontSize: 14,
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 16,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

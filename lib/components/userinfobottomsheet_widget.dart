import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UserinfobottomsheetWidget extends StatefulWidget {
  const UserinfobottomsheetWidget({Key key}) : super(key: key);

  @override
  _UserinfobottomsheetWidgetState createState() =>
      _UserinfobottomsheetWidgetState();
}

class _UserinfobottomsheetWidgetState extends State<UserinfobottomsheetWidget> {
  TextEditingController userCountryController;
  TextEditingController userEmailController;
  TextEditingController userNameController;

  @override
  void initState() {
    super.initState();
    userCountryController = TextEditingController();
    userEmailController = TextEditingController();
    userNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: TextFormField(
              controller: userNameController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Your name',
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
                contentPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  size: 32,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.phone,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: TextFormField(
              controller: userEmailController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Your email',
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
                contentPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  size: 32,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.phone,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: TextFormField(
              controller: userCountryController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'You country',
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
                contentPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  size: 32,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.phone,
            ),
          ),
        ),
        FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: 'OK',
          options: FFButtonOptions(
            width: double.infinity,
            height: 40,
            color: FlutterFlowTheme.of(context).primaryColor,
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
      ],
    );
  }
}

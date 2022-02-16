import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAccountWidget extends StatefulWidget {
  const UserAccountWidget({Key key}) : super(key: key);

  @override
  _UserAccountWidgetState createState() => _UserAccountWidgetState();
}

class _UserAccountWidgetState extends State<UserAccountWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      constraints: BoxConstraints(
                        maxHeight: 45,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x411D2429),
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'широкая кнопка',
                        icon: Icon(
                          Icons.directions_run,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          size: 26,
                        ),
                        options: FFButtonOptions(
                          width: 150,
                          height: 45,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Oswald',
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                          elevation: 1,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

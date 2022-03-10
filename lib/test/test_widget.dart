import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Oswald',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: AuthUserStreamWidget(
                  child: Builder(
                    builder: (context) {
                      final collectedads =
                          currentUserDocument?.collectedAds?.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: collectedads.length,
                        itemBuilder: (context, collectedadsIndex) {
                          final collectedadsItem =
                              collectedads[collectedadsIndex];
                          return StreamBuilder<AdsRecord>(
                            stream: AdsRecord.getDocument(collectedadsItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitChasingDots(
                                      color: Color(0xFFE66F2D),
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final listTileAdsRecord = snapshot.data;
                              return ListTile(
                                title: Text(
                                  listTileAdsRecord.adItem,
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                                subtitle: Text(
                                  'Lorem ipsum dolor...',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Oswald',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF303030),
                                  size: 20,
                                ),
                                tileColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                dense: false,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: AuthUserStreamWidget(
                  child: Builder(
                    builder: (context) {
                      final receivedAdsList =
                          currentUserDocument?.receivedAds?.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: receivedAdsList.length,
                        itemBuilder: (context, receivedAdsListIndex) {
                          final receivedAdsListItem =
                              receivedAdsList[receivedAdsListIndex];
                          return StreamBuilder<AdsRecord>(
                            stream: AdsRecord.getDocument(receivedAdsListItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitChasingDots(
                                      color: Color(0xFFE66F2D),
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final listTileAdsRecord = snapshot.data;
                              return ListTile(
                                title: Text(
                                  listTileAdsRecord.adItem,
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                                subtitle: Text(
                                  'Lorem ipsum dolor...',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Oswald',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF303030),
                                  size: 20,
                                ),
                                tileColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                dense: false,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

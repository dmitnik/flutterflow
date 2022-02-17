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
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitChasingDots(
                color: FlutterFlowTheme.of(context).links,
                size: 50,
              ),
            ),
          );
        }
        List<UsersRecord> testUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final testUsersRecord =
            testUsersRecordList.isNotEmpty ? testUsersRecordList.first : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    testUsersRecord.displayName,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Expanded(
                    child: StreamBuilder<List<AdsRecord>>(
                      stream: queryAdsRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitChasingDots(
                                color: FlutterFlowTheme.of(context).links,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<AdsRecord> listViewAdsRecordList = snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewAdsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewAdsRecord =
                                listViewAdsRecordList[listViewIndex];
                            return StreamBuilder<List<StoresRecord>>(
                              stream: queryStoresRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitChasingDots(
                                        color:
                                            FlutterFlowTheme.of(context).links,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<StoresRecord> containerStoresRecordList =
                                    snapshot.data;
                                return Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        listViewAdsRecord.storeName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        listViewAdsRecord.adItem,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      StreamBuilder<StoresRecord>(
                                        stream: StoresRecord.getDocument(
                                            listViewAdsRecord.owningStore),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: SpinKitChasingDots(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .links,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          final textStoresRecord =
                                              snapshot.data;
                                          return Text(
                                            textStoresRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

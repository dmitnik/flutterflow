import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectedGiftPageWidget extends StatefulWidget {
  const CollectedGiftPageWidget({
    Key key,
    this.collectedGiftReference,
  }) : super(key: key);

  final DocumentReference collectedGiftReference;

  @override
  _CollectedGiftPageWidgetState createState() =>
      _CollectedGiftPageWidgetState();
}

class _CollectedGiftPageWidgetState extends State<CollectedGiftPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AdsRecord>(
      stream: AdsRecord.getDocument(widget.collectedGiftReference),
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
        final collectedGiftPageAdsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: true,
            title: AuthUserStreamWidget(
              child: Text(
                currentUserDisplayName,
                style: FlutterFlowTheme.of(context).title1,
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
              child: StreamBuilder<List<StoresRecord>>(
                stream: queryStoresRecord(
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
                          color: Color(0xFFE66F2D),
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<StoresRecord> columnStoresRecordList = snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final columnStoresRecord = columnStoresRecordList.isNotEmpty
                      ? columnStoresRecordList.first
                      : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Вы хотите бесплатно получить ${collectedGiftPageAdsRecord.adItem}?',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                      Text(
                        'Покажите  QR код на кассе в ',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Builder(
                          builder: (context) {
                            final listofstores = collectedGiftPageAdsRecord
                                    .adOwningStores
                                    .toList()
                                    ?.toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listofstores.length,
                              itemBuilder: (context, listofstoresIndex) {
                                final listofstoresItem =
                                    listofstores[listofstoresIndex];
                                return StreamBuilder<StoresRecord>(
                                  stream: StoresRecord.getDocument(
                                      listofstoresItem),
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
                                    final rowStoresRecord = snapshot.data;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${rowStoresRecord.storeName}:${rowStoresRecord.storeAddress}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/qr.png',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Отмена',
                          options: FFButtonOptions(
                            width: double.infinity,
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
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

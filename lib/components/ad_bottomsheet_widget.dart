import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdBottomsheetWidget extends StatefulWidget {
  const AdBottomsheetWidget({
    Key key,
    this.adId,
  }) : super(key: key);

  final DocumentReference adId;

  @override
  _AdBottomsheetWidgetState createState() => _AdBottomsheetWidgetState();
}

class _AdBottomsheetWidgetState extends State<AdBottomsheetWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AdsRecord>(
      stream: AdsRecord.getDocument(widget.adId),
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
        final containerAdsRecord = snapshot.data;
        return Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            containerAdsRecord.adImage,
                            width: 180,
                            height: 120,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: StreamBuilder<StoresRecord>(
                            stream: StoresRecord.getDocument(
                                containerAdsRecord.owningStore),
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
                              final textStoresRecord = snapshot.data;
                              return AutoSizeText(
                                textStoresRecord.name,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Oswald',
                                      fontSize: 16,
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            containerAdsRecord.adAddress,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Oswald',
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 3),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            containerAdsRecord.adItem,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Oswald',
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'осталось ',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Oswald',
                              color: FlutterFlowTheme.of(context).dred,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        containerAdsRecord.adGiftsAmount.toString(),
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Oswald',
                              color: FlutterFlowTheme.of(context).dred,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: Icon(
                          Icons.card_giftcard_sharp,
                          color: FlutterFlowTheme.of(context).dred,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 3),
                  FFButtonWidget(
                    onPressed: () async {
                      final usersUpdateData = {
                        'collected_ads': FieldValue.arrayUnion([widget.adId]),
                      };
                      await currentUserReference.update(usersUpdateData);
                    },
                    text: 'Collect',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).links,
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
            ),
          ),
        );
      },
    );
  }
}

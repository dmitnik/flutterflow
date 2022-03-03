import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../store_page/store_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdBottomsheetWidget extends StatefulWidget {
  const AdBottomsheetWidget({
    Key key,
    this.adReference,
  }) : super(key: key);

  final DocumentReference adReference;

  @override
  _AdBottomsheetWidgetState createState() => _AdBottomsheetWidgetState();
}

class _AdBottomsheetWidgetState extends State<AdBottomsheetWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AdsRecord>(
      stream: AdsRecord.getDocument(widget.adReference),
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
        final containerAdsRecord = snapshot.data;
        return Material(
          color: Colors.transparent,
          elevation: 2,
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              child: StreamBuilder<List<StoresRecord>>(
                stream: queryStoresRecord(
                  queryBuilder: (storesRecord) => storesRecord
                      .where('store_ads', arrayContains: widget.adReference),
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
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          'https://picsum.photos/seed/920/600',
                          width: 180,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 500),
                              reverseDuration: Duration(milliseconds: 500),
                              child: StorePageWidget(
                                storePageStore: columnStoresRecord.reference,
                              ),
                            ),
                          );
                        },
                        child: AutoSizeText(
                          columnStoresRecord.storeName,
                          textAlign: TextAlign.justify,
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                      AutoSizeText(
                        columnStoresRecord.storeAddress.maybeHandleOverflow(
                          maxChars: 40,
                          replacement: '…',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            containerAdsRecord.adItem,
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Oswald',
                                      color: FlutterFlowTheme.of(context).dred,
                                    ),
                          ),
                          Text(
                            ' x ',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                          Text(
                            containerAdsRecord.adItemsAmmount.toString(),
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Oswald',
                                      color: FlutterFlowTheme.of(context).dred,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'to Store',
                            icon: Icon(
                              Icons.store,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Navigate',
                            icon: Icon(
                              Icons.navigation,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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

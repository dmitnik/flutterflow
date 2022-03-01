import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../store_page/store_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreBottomsheetWidget extends StatefulWidget {
  const StoreBottomsheetWidget({
    Key key,
    this.store,
  }) : super(key: key);

  final StoresRecord store;

  @override
  _StoreBottomsheetWidgetState createState() => _StoreBottomsheetWidgetState();
}

class _StoreBottomsheetWidgetState extends State<StoreBottomsheetWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StoresRecord>(
      stream: StoresRecord.getDocument(widget.store.reference),
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
        final containerStoresRecord = snapshot.data;
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  height: 16,
                  thickness: 1,
                  indent: 65,
                  endIndent: 65,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                AutoSizeText(
                  widget.store.storeName,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title1,
                ),
                Text(
                  widget.store.storeAddress.maybeHandleOverflow(maxChars: 50),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).subtitle1,
                ),
                Text(
                  'у нас Вас ждут следующие подарки:',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).subtitle1,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: StreamBuilder<List<AdsRecord>>(
                      stream: queryAdsRecord(
                        queryBuilder: (adsRecord) => adsRecord.where(
                            'ad_owning_store',
                            isEqualTo: widget.store.reference),
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
                        List<AdsRecord> gridViewAdsRecordList = snapshot.data;
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: gridViewAdsRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewAdsRecord =
                                gridViewAdsRecordList[gridViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        gridViewAdsRecord.adItem,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Oswald',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                      ),
                                      Text(
                                        gridViewAdsRecord.adItemsAmmount
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32, 8, 32, 8),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StorePageWidget(
                            storePageStore: widget.store.reference,
                          ),
                        ),
                      );
                    },
                    text: 'Открыть страницу магазина',
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
                      borderRadius: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

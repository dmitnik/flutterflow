import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../store_page/store_page_widget.dart';
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
            height: 300,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      containerAdsRecord.adImage,
                      width: 180,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        containerAdsRecord.adItem,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).subtitle1.override(
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
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Oswald',
                              color: FlutterFlowTheme.of(context).dred,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Builder(
                      builder: (context) {
                        final listofstores = containerAdsRecord.adOwningStores
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
                              stream:
                                  StoresRecord.getDocument(listofstoresItem),
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
                                return Container(
                                  width: double.infinity,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 500),
                                          reverseDuration:
                                              Duration(milliseconds: 500),
                                          child: StorePageWidget(
                                            storePageStore:
                                                containerStoresRecord.reference,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      containerStoresRecord.storeName,
                                      textAlign: TextAlign.center,
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
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

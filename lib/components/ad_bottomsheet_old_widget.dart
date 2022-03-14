import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../store_page/store_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdBottomsheetOldWidget extends StatefulWidget {
  const AdBottomsheetOldWidget({
    Key key,
    this.adReference,
  }) : super(key: key);

  final DocumentReference adReference;

  @override
  _AdBottomsheetOldWidgetState createState() => _AdBottomsheetOldWidgetState();
}

class _AdBottomsheetOldWidgetState extends State<AdBottomsheetOldWidget> {
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
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
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
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    height: 15,
                    thickness: 2,
                    indent: 160,
                    endIndent: 160,
                    color: Color(0x98245288),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Image.network(
                      containerAdsRecord.adImage,
                      width: double.infinity,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
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
                                    fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);

                              final adsUpdateData = {
                                'ad_items_ammount': FieldValue.increment(-1),
                                'ad_have_collected': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              };
                              await containerAdsRecord.reference
                                  .update(adsUpdateData);

                              final usersUpdateData = {
                                'collected_ads':
                                    FieldValue.arrayUnion([widget.adReference]),
                              };
                              await currentUserReference
                                  .update(usersUpdateData);
                            },
                            child: FaIcon(
                              FontAwesomeIcons.handHoldingHeart,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Подарок доступен в следующих заведениях:',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Builder(
                              builder: (context) {
                                final adOwningStores = containerAdsRecord
                                        .adOwningStores
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 0.5,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: adOwningStores.length,
                                  itemBuilder: (context, adOwningStoresIndex) {
                                    final adOwningStoresItem =
                                        adOwningStores[adOwningStoresIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 4, 4),
                                      child: StreamBuilder<StoresRecord>(
                                        stream: StoresRecord.getDocument(
                                            adOwningStoresItem),
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
                                          final cardStoresRecord =
                                              snapshot.data;
                                          return InkWell(
                                            onTap: () async {
                                              Navigator.pop(context);
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .bottomToTop,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child: StorePageWidget(
                                                    storePageStore:
                                                        cardStoresRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0xFFF5F5F5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      cardStoresRecord
                                                          .storeName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      cardStoresRecord
                                                          .storeAddress
                                                          .maybeHandleOverflow(
                                                              maxChars: 35),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

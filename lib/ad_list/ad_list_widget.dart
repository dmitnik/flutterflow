import '../backend/backend.dart';
import '../components/ad_bottomsheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdListWidget extends StatefulWidget {
  const AdListWidget({
    Key key,
    this.adReference,
  }) : super(key: key);

  final DocumentReference adReference;

  @override
  _AdListWidgetState createState() => _AdListWidgetState();
}

class _AdListWidgetState extends State<AdListWidget> {
  TextEditingController searchOnMapController;
  var qrcodescanned = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchOnMapController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AdsRecord>>(
      stream: queryAdsRecord(
        queryBuilder: (adsRecord) =>
            adsRecord.where('ad_gifts_amount', isGreaterThan: 0),
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
        List<AdsRecord> adListAdsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 8),
                                child: TextFormField(
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'searchOnMapController',
                                    Duration(milliseconds: 600),
                                    () => setState(() {}),
                                  ),
                                  controller: searchOnMapController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Search',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      size: 16,
                                    ),
                                    suffixIcon: searchOnMapController
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () => setState(
                                              () =>
                                                  searchOnMapController.clear(),
                                            ),
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 16,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: StreamBuilder<List<AdsRecord>>(
                          stream: queryAdsRecord(
                            queryBuilder: (adsRecord) => adsRecord
                                .where('ad_gifts_amount', isGreaterThan: 0),
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
                            List<AdsRecord> gridViewAdsRecordList =
                                snapshot.data;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 4,
                                childAspectRatio: 0.8,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewAdsRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewAdsRecord =
                                    gridViewAdsRecordList[gridViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6, 0, 6, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.65,
                                              child: AdBottomsheetWidget(
                                                adReference: gridViewAdsRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2,
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Image.network(
                                                    gridViewAdsRecord.adImage,
                                                    width: 180,
                                                    height: 120,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          StoresRecord>(
                                                        stream: StoresRecord
                                                            .getDocument(
                                                                gridViewAdsRecord
                                                                    .owningStore),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitChasingDots(
                                                                  color: Color(
                                                                      0xFFE66F2D),
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final textStoresRecord =
                                                              snapshot.data;
                                                          return AutoSizeText(
                                                            '«${textStoresRecord.name}»‎  ',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title2,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      gridViewAdsRecord.adItem,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Oswald',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Wrap(
                                                  spacing: 0,
                                                  runSpacing: 0,
                                                  alignment:
                                                      WrapAlignment.center,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.center,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 0,
                                                      borderWidth: 0,
                                                      buttonSize: 25,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .mapMarkerAlt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .linksbuttons,
                                                        size: 15,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                    StreamBuilder<StoresRecord>(
                                                      stream: StoresRecord
                                                          .getDocument(
                                                              gridViewAdsRecord
                                                                  .owningStore),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitChasingDots(
                                                                color: Color(
                                                                    0xFFE66F2D),
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textStoresRecord =
                                                            snapshot.data;
                                                        return Text(
                                                          textStoresRecord
                                                              .storeAddress
                                                              .maybeHandleOverflow(
                                                            maxChars: 20,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Oswald',
                                                                fontSize: 10,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Wrap(
                                                  spacing: 0,
                                                  runSpacing: 0,
                                                  alignment:
                                                      WrapAlignment.center,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.center,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Text(
                                                      gridViewAdsRecord
                                                          .adGiftsAmount
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Oswald',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dred,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Icon(
                                                        Icons
                                                            .card_giftcard_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dred,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.97),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 35,
                      borderWidth: 1,
                      buttonSize: 50,
                      fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                      icon: Icon(
                        Icons.qr_code_scanner,
                        color: FlutterFlowTheme.of(context).linksbuttons,
                        size: 30,
                      ),
                      onPressed: () async {
                        qrcodescanned = await FlutterBarcodeScanner.scanBarcode(
                          '#C62828', // scanning line color
                          'Cancel', // cancel button text
                          true, // whether to show the flash icon
                          ScanMode.QR,
                        );

                        setState(() {});
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

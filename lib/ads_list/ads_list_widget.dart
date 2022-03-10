import '../backend/backend.dart';
import '../components/ad_bottomsheet_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdsListWidget extends StatefulWidget {
  const AdsListWidget({
    Key key,
    this.adReference,
  }) : super(key: key);

  final DocumentReference adReference;

  @override
  _AdsListWidgetState createState() => _AdsListWidgetState();
}

class _AdsListWidgetState extends State<AdsListWidget> {
  String choiceChipsValue;
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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryColor),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 32,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      drawer: Drawer(
        elevation: 16,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, -1),
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
                                labelText: 'Поиск',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 14,
                                ),
                                suffixIcon: searchOnMapController
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => searchOnMapController.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 16,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Oswald',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FlutterFlowChoiceChips(
                              initiallySelected: choiceChipsValue != null
                                  ? [choiceChipsValue]
                                  : ['Все подарки'],
                              options: [
                                ChipData('Все подарки', Icons.select_all),
                                ChipData('Услуги', Icons.work_outline),
                                ChipData(
                                    'Еда / напитки', Icons.fastfood_outlined)
                              ],
                              onChanged: (val) =>
                                  setState(() => choiceChipsValue = val.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle:
                                    FlutterFlowTheme.of(context).subtitle2,
                                iconColor: Colors.white,
                                iconSize: 14,
                                elevation: 2,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Oswald',
                                      color: Color(0xFF262D34),
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                iconSize: 14,
                                elevation: 0,
                              ),
                              chipSpacing: 8,
                              multiselect: false,
                            ),
                          ),
                        ],
                      ),
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
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.7,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewAdsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewAdsRecord =
                                  gridViewAdsRecordList[gridViewIndex];
                              return StreamBuilder<List<StoresRecord>>(
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
                                  List<StoresRecord> containerStoresRecordList =
                                      snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final containerStoresRecord =
                                      containerStoresRecordList.isNotEmpty
                                          ? containerStoresRecordList.first
                                          : null;
                                  return InkWell(
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
                                              height: 300,
                                              child: AdBottomsheetWidget(
                                                adReference:
                                                    gridViewAdsRecord.reference,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            containerStoresRecord.storeOwner),
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
                                          final columnUsersRecord =
                                              snapshot.data;
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                  ),
                                                  child: Image.network(
                                                    gridViewAdsRecord.adImage,
                                                    width: double.infinity,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.21,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              AutoSizeText(
                                                '«${columnUsersRecord.displayName}»‎',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2,
                                              ),
                                              Wrap(
                                                spacing: 0,
                                                runSpacing: 0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Text(
                                                    gridViewAdsRecord.adItem,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Oswald',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dred,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Text(
                                                    ' x ',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1,
                                                  ),
                                                  Text(
                                                    gridViewAdsRecord
                                                        .adItemsAmmount
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Oswald',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dred,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
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
              Align(
                alignment: AlignmentDirectional(-0.95, 0.98),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: const CircleBorder(),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 35,
                      buttonSize: 50,
                      fillColor: Color(0xDA245288),
                      icon: Icon(
                        Icons.qr_code_scanner,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

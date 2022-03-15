import '../add_ad/add_ad_widget.dart';
import '../add_store/add_store_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../collected_gift_page/collected_gift_page_widget.dart';
import '../components/search_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../user_account/user_account_widget.dart';
import '../user_login/user_login_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({Key key}) : super(key: key);

  @override
  _WalletWidgetState createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
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
                color: Color(0xFFE66F2D),
                size: 50,
              ),
            ),
          );
        }
        List<UsersRecord> walletUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final walletUsersRecord = walletUsersRecordList.isNotEmpty
            ? walletUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          drawer: Drawer(
            elevation: 16,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Container(
                                width: 80,
                                height: 80,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/253/600',
                                ),
                              ),
                            ),
                            AuthUserStreamWidget(
                              child: Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child: UserAccountWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    'Edit my account',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child: AddAdWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    'Add gift',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child: AddStoreWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    'Add store',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await signOut();
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child: UserLoginWidget(),
                                    ),
                                    (r) => false,
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    'Logout',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  scaffoldKey.currentState.openDrawer();
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, -1),
                                child: TextFormField(
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'searchOnMapController',
                                    Duration(milliseconds: 600),
                                    () => setState(() {}),
                                  ),
                                  onFieldSubmitted: (_) async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: SearchBottomSheetWidget(),
                                        );
                                      },
                                    );
                                  },
                                  controller: searchOnMapController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Поиск',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 14,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                          child: Text(
                            'Мои подарки',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Oswald',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                            child: Builder(
                              builder: (context) {
                                final collectedGiftList = walletUsersRecord
                                        .collectedAds
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: collectedGiftList.length,
                                  itemBuilder:
                                      (context, collectedGiftListIndex) {
                                    final collectedGiftListItem =
                                        collectedGiftList[
                                            collectedGiftListIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: StreamBuilder<AdsRecord>(
                                        stream: AdsRecord.getDocument(
                                            collectedGiftListItem),
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
                                          final containerAdsRecord =
                                              snapshot.data;
                                          return InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .bottomToTop,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child:
                                                      CollectedGiftPageWidget(
                                                    collectedGiftReference:
                                                        containerAdsRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(8),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  0),
                                                        ),
                                                        child: Image.network(
                                                          containerAdsRecord
                                                              .adImage,
                                                          width: 60,
                                                          height: 40,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              containerAdsRecord
                                                                  .adItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  containerAdsRecord
                                                                      .adOwner),
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
                                                            final columnUsersRecord =
                                                                snapshot.data;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  columnUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 1,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
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
                            qrcodescanned =
                                await FlutterBarcodeScanner.scanBarcode(
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
      },
    );
  }
}

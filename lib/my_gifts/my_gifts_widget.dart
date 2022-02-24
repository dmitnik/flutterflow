import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../my_ads/my_ads_widget.dart';
import '../my_stores/my_stores_widget.dart';
import '../user_account/user_account_widget.dart';
import '../user_login/user_login_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGiftsWidget extends StatefulWidget {
  const MyGiftsWidget({Key key}) : super(key: key);

  @override
  _MyGiftsWidgetState createState() => _MyGiftsWidgetState();
}

class _MyGiftsWidgetState extends State<MyGiftsWidget> {
  TextEditingController searchOnMapController;
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
        title: AuthUserStreamWidget(
          child: Text(
            '${currentUserDisplayName}´s  gifts',
            style: FlutterFlowTheme.of(context).title1,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 6,
      ),
      backgroundColor: FlutterFlowTheme.of(context).silverbg,
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
                  color: FlutterFlowTheme.of(context).tertiaryColor,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
                                MaterialPageRoute(
                                  builder: (context) => UserAccountWidget(),
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
                                MaterialPageRoute(
                                  builder: (context) => MyAdsWidget(),
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
                                MaterialPageRoute(
                                  builder: (context) => MyStoresWidget(),
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
                                MaterialPageRoute(
                                  builder: (context) => UserLoginWidget(),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                spacing: 0,
                runSpacing: 0,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.center,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(32, 16, 32, 16),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                              labelText: 'Search',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).tertiaryColor,
                              prefixIcon: Icon(
                                Icons.search,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                size: 16,
                              ),
                              suffixIcon: searchOnMapController.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => searchOnMapController.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .linksbuttons,
                                        size: 16,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Oswald',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        'My gifts collection',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Oswald',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: AuthUserStreamWidget(
                  child: Builder(
                    builder: (context) {
                      final collectedAds =
                          currentUserDocument?.collectedAds?.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: collectedAds.length,
                        itemBuilder: (context, collectedAdsIndex) {
                          final collectedAdsItem =
                              collectedAds[collectedAdsIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                            child: StreamBuilder<AdsRecord>(
                              stream: AdsRecord.getDocument(collectedAdsItem),
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
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
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
                                                color: Color(0xFFE66F2D),
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        final listTileStoresRecord =
                                            snapshot.data;
                                        return Slidable(
                                          actionPane:
                                              const SlidableScrollActionPane(),
                                          secondaryActions: [
                                            IconSlideAction(
                                              caption: 'Navigate me to',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              icon: FontAwesomeIcons.rocket,
                                              onTap: () {
                                                print(
                                                    'SlidableActionWidget pressed ...');
                                              },
                                            ),
                                          ],
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.card_giftcard_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dred,
                                              size: 25,
                                            ),
                                            title: Text(
                                              containerAdsRecord.adItem,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Oswald',
                                                        fontSize: 18,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              '${listTileStoresRecord.name} (${listTileStoresRecord.storeAddress})'
                                                  .maybeHandleOverflow(
                                                maxChars: 90,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Oswald',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 12,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .linksbuttons,
                                              size: 25,
                                            ),
                                            tileColor: Colors.white,
                                            dense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32, 0, 32, 0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        );
                                      },
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
      ),
    );
  }
}

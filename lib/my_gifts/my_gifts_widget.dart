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
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        List<UsersRecord> myGiftsUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final myGiftsUsersRecord = myGiftsUsersRecordList.isNotEmpty
            ? myGiftsUsersRecordList.first
            : null;
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
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                            'Collected Gifts',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Oswald',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: StreamBuilder<List<AdsRecord>>(
                        stream: queryAdsRecord(
                          queryBuilder: (adsRecord) => adsRecord.where(
                              'ad_have_collected',
                              arrayContains: currentUserReference),
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
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewAdsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewAdsRecord =
                                  gridViewAdsRecordList[gridViewIndex];
                              return Material(
                                color: Colors.transparent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        gridViewAdsRecord.adItem,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Image.network(
                                        gridViewAdsRecord.adImage,
                                        width: 32,
                                        height: 32,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
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
      },
    );
  }
}

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StorePageWidget extends StatefulWidget {
  const StorePageWidget({
    Key key,
    this.storePageStore,
  }) : super(key: key);

  final DocumentReference storePageStore;

  @override
  _StorePageWidgetState createState() => _StorePageWidgetState();
}

class _StorePageWidgetState extends State<StorePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 550,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StoresRecord>(
      stream: StoresRecord.getDocument(widget.storePageStore),
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
        final storePageStoresRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            automaticallyImplyLeading: false,
            title: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(storePageStoresRecord.storeOwner),
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
                final textUsersRecord = snapshot.data;
                return Text(
                  textUsersRecord.displayName,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Oswald',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22,
                      ),
                );
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Подарки в ',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                        Text(
                          storePageStoresRecord.storeName,
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'по адресу: ',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          storePageStoresRecord.storeAddress,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<AdsRecord>>(
                        stream: queryAdsRecord(
                          queryBuilder: (adsRecord) => adsRecord.where(
                              'ad_owning_stores',
                              arrayContains: widget.storePageStore),
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
                          if (gridViewAdsRecordList.isEmpty) {
                            return SvgPicture.asset(
                              'assets/images/logoipsum-logo-16.svg',
                            );
                          }
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 1,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewAdsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewAdsRecord =
                                  gridViewAdsRecordList[gridViewIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      gridViewAdsRecord.adImage,
                                      width: 90,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    gridViewAdsRecord.adItem,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Oswald',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                        ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Наши заведения:',
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Expanded(
                            child: StreamBuilder<List<StoresRecord>>(
                              stream: queryStoresRecord(
                                queryBuilder: (storesRecord) =>
                                    storesRecord.where('store_owner',
                                        isEqualTo:
                                            storePageStoresRecord.storeOwner),
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
                                List<StoresRecord> listViewStoresRecordList =
                                    snapshot.data;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewStoresRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewStoresRecord =
                                        listViewStoresRecordList[listViewIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StorePageWidget(
                                                storePageStore:
                                                    listViewStoresRecord
                                                        .reference,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              listViewStoresRecord.storeName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title2
                                                  .override(
                                                    fontFamily: 'Oswald',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              ' по адресу: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Text(
                                              listViewStoresRecord.storeAddress,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                        ],
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ).animated([animationsMap['columnOnPageLoadAnimation']]),
              ),
            ),
          ),
        );
      },
    );
  }
}

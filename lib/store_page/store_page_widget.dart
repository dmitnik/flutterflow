import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              storePageStoresRecord.storeName,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Oswald',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [
              InkWell(
                onTap: () async {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.topToBottom,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: NavBarPage(initialPage: 'map'),
                    ),
                    (r) => false,
                  );
                },
                child: Icon(
                  Icons.clear,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 24,
                ),
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      storePageStoresRecord.storeAddress,
                      style: FlutterFlowTheme.of(context).title2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: FlutterFlowGoogleMap(
                          controller: googleMapsController,
                          onCameraIdle: (latLng) => googleMapsCenter = latLng,
                          initialLocation: googleMapsCenter ??=
                              storePageStoresRecord.storeLocation,
                          markers: [
                            if (storePageStoresRecord != null)
                              FlutterFlowMarker(
                                storePageStoresRecord.reference.path,
                                storePageStoresRecord.storeLocation,
                              ),
                          ],
                          markerColor: GoogleMarkerColor.violet,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 15,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: true,
                          showLocation: true,
                          showCompass: false,
                          showMapToolbar: false,
                          showTraffic: false,
                          centerMapOnMarkerTap: true,
                        ),
                      ),
                    ),
                    Expanded(
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
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewAdsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewAdsRecord =
                                  gridViewAdsRecordList[gridViewIndex];
                              return Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                          .bodyText1,
                                    ),
                                    Text(
                                      gridViewAdsRecord.adItemsAmmount
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
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

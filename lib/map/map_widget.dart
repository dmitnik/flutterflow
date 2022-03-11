import '../backend/backend.dart';
import '../components/search_bottom_sheet_widget.dart';
import '../components/store_bottomsheet_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key key,
    this.centerStoreOnMap,
  }) : super(key: key);

  final LatLng centerStoreOnMap;

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  var qrcodescanned = '';
  TextEditingController searchOnMapController;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    searchOnMapController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return StreamBuilder<List<AdsRecord>>(
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
        List<AdsRecord> mapAdsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          drawer: Drawer(
            elevation: 16,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: StreamBuilder<List<StoresRecord>>(
                        stream: queryStoresRecord(),
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
                          List<StoresRecord> googleMapStoresRecordList =
                              snapshot.data;
                          return FlutterFlowGoogleMap(
                            controller: googleMapsController,
                            onCameraIdle: (latLng) =>
                                setState(() => googleMapsCenter = latLng),
                            initialLocation: googleMapsCenter ??=
                                currentUserLocationValue,
                            markers: (googleMapStoresRecordList ?? [])
                                .map(
                                  (googleMapStoresRecord) => FlutterFlowMarker(
                                    googleMapStoresRecord.reference.path,
                                    googleMapStoresRecord.storeLocation,
                                    () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: 370,
                                              child: StoreBottomsheetWidget(
                                                store: googleMapStoresRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.orange,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 16,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: true,
                            showMapToolbar: true,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.95, 0.98),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 8,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 40,
                            buttonSize: 50,
                            fillColor: Color(0xD9245288),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
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
                                  filled: true,
                                  fillColor: Color(0xCCFFFFFF),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

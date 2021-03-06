import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LatLng currentUserLocationValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  String choiceChipsValue;
  TextEditingController searchOnMapController;
  var qrcodescanned = '';

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
            color: FlutterFlowTheme.of(context).links,
            size: 50,
          ),
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                      color: FlutterFlowTheme.of(context).links,
                      size: 50,
                    ),
                  ),
                );
              }
              List<AdsRecord> formAdsRecordList = snapshot.data;
              return Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Stack(
                  children: [
                    FlutterFlowGoogleMap(
                      controller: googleMapsController,
                      onCameraIdle: (latLng) =>
                          setState(() => googleMapsCenter = latLng),
                      initialLocation: googleMapsCenter ??=
                          currentUserLocationValue,
                      markers: (formAdsRecordList ?? [])
                          .map(
                            (formAdsRecord) => FlutterFlowMarker(
                              formAdsRecord.reference.path,
                              formAdsRecord.adLocation,
                            ),
                          )
                          .toList(),
                      markerColor: GoogleMarkerColor.red,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 17,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: true,
                      showMapToolbar: true,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.85),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: FlutterFlowChoiceChips(
                          initiallySelected: [choiceChipsValue],
                          options: [
                            ChipData('Nearest', Icons.near_me),
                            ChipData(
                                'Ending gifts', Icons.trending_down_rounded)
                          ],
                          onChanged: (val) =>
                              setState(() => choiceChipsValue = val.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context).links,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Oswald',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 14,
                                    ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            iconSize: 20,
                            elevation: 0,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Oswald',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            iconSize: 20,
                            elevation: 2,
                          ),
                          chipSpacing: 16,
                          multiselect: false,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
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
                            labelText: 'Search',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            prefixIcon: Icon(
                              Icons.search,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 24,
                            ),
                            suffixIcon: searchOnMapController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => searchOnMapController.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Oswald',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0.35),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 35,
                          borderWidth: 1,
                          buttonSize: 50,
                          fillColor: Color(0xB90A3771),
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

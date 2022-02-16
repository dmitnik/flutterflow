import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class MyGiftBottomsheetWidget extends StatefulWidget {
  const MyGiftBottomsheetWidget({Key key}) : super(key: key);

  @override
  _MyGiftBottomsheetWidgetState createState() =>
      _MyGiftBottomsheetWidgetState();
}

class _MyGiftBottomsheetWidgetState extends State<MyGiftBottomsheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 350,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tertiaryColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '« Rumble Bumble Scramble Coffee »‎  ',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).links,
                          fontSize: 20,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: Icon(
                          Icons.card_giftcard_sharp,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          size: 24,
                        ),
                      ),
                      Text(
                        'чай с сахаром',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Oswald',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  FlutterFlowStaticMap(
                    location: LatLng(9.341465, -79.891704),
                    apiKey:
                        'pk.eyJ1IjoiZG1pdHJpLW5pa2l0aW4iLCJhIjoiY2t6bXJybXNsMWh2NDJ1bGxvdTk4bnptdSJ9.wSqZUN2Ngbujn8o9mahOog',
                    style: MapBoxStyle.Streets,
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(0),
                    markerColor: Color(0xFFFF0000),
                    cached: true,
                    zoom: 13,
                    tilt: 0,
                    rotation: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

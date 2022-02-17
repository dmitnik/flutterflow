import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAdWidget extends StatefulWidget {
  const CreateAdWidget({Key key}) : super(key: key);

  @override
  _CreateAdWidgetState createState() => _CreateAdWidgetState();
}

class _CreateAdWidgetState extends State<CreateAdWidget> {
  DateTime datePicked;
  var placePickerValue = FFPlace();
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  int countControllerValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 =
        TextEditingController(text: 'https://picsum.photos/300/100');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController1',
                              Duration(milliseconds: 600),
                              () => setState(() {}),
                            ),
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'store name',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.store,
                                size: 25,
                              ),
                              suffixIcon: textController1.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => textController1.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 25,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController2',
                              Duration(milliseconds: 600),
                              () => setState(() {}),
                            ),
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'ad item\n',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.card_giftcard,
                                size: 30,
                              ),
                              suffixIcon: textController2.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => textController2.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 25,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController3',
                              Duration(milliseconds: 600),
                              () => setState(() {}),
                            ),
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'image url',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.url,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyAfA44eDd6-qW_9MdJJIuGOke3Qx7wRmx0',
                          androidGoogleMapsApiKey:
                              'AIzaSyBTdqV2OX-r25v3q-LBXz_Qij1IDGxcojg',
                          webGoogleMapsApiKey:
                              'AIzaSyB9o0JFAWH7eU4-G8ULNKE82dIrwQg8H9k',
                          onSelect: (place) =>
                              setState(() => placePickerValue = place),
                          defaultText: 'Select Location',
                          icon: Icon(
                            Icons.place,
                            color: Colors.white,
                            size: 16,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 250,
                            height: 30,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Oswald',
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked = date);
                            },
                            currentTime: getCurrentTimestamp,
                            minTime: getCurrentTimestamp,
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF9E9E9E),
                                width: 1,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.minus,
                                color: enabled
                                    ? Color(0xDD000000)
                                    : Color(0xFFEEEEEE),
                                size: 12,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.plus,
                                color:
                                    enabled ? Colors.blue : Color(0xFFEEEEEE),
                                size: 12,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                              count: countControllerValue ??= 5,
                              updateCount: (count) =>
                                  setState(() => countControllerValue = count),
                              stepSize: 5,
                              minimum: 5,
                              maximum: 100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final adsCreateData = createAdsRecordData(
                                storeName: textController1.text,
                                adImage: textController3.text,
                                adItem: textController2.text,
                                adLocation: placePickerValue.latLng,
                                adGiftsAmount: countControllerValue,
                                adAddress: placePickerValue.address,
                                createdBy: currentUserReference,
                                activatingDate: datePicked,
                              );
                              await AdsRecord.collection
                                  .doc()
                                  .set(adsCreateData);
                            },
                            text: 'save',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).links,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Oswald',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: textController3.text,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  '«${textController1.text}»‎  ',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Oswald',
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AutoSizeText(
                              textController2.text,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Oswald',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              spacing: 0,
                              runSpacing: 0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 0,
                                  borderWidth: 0,
                                  buttonSize: 35,
                                  icon: FaIcon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    color: FlutterFlowTheme.of(context).links,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                AutoSizeText(
                                  placePickerValue.address.maybeHandleOverflow(
                                    maxChars: 50,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Oswald',
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ],
                            ),
                            Wrap(
                              spacing: 0,
                              runSpacing: 0,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.center,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Text(
                                  countControllerValue.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Oswald',
                                        color:
                                            FlutterFlowTheme.of(context).dred,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 4, 0),
                                  child: Icon(
                                    Icons.card_giftcard_sharp,
                                    color: FlutterFlowTheme.of(context).dred,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateTimeFormat('d/M/y', datePicked),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
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

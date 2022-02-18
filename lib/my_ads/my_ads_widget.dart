import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAdsWidget extends StatefulWidget {
  const MyAdsWidget({Key key}) : super(key: key);

  @override
  _MyAdsWidgetState createState() => _MyAdsWidgetState();
}

class _MyAdsWidgetState extends State<MyAdsWidget> {
  DateTime datePicked;
  String dropDownValue;
  TextEditingController textController1;
  int countControllerValue;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 =
        TextEditingController(text: 'https://picsum.photos/300/100');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(),
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
        List<UsersRecord> myAdsUsersRecordList = snapshot.data;
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: StreamBuilder<List<StoresRecord>>(
                          stream: queryStoresRecord(
                            queryBuilder: (storesRecord) => storesRecord.where(
                                'owner',
                                isEqualTo: currentUserReference),
                          ),
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
                            List<StoresRecord> dropDownStoresRecordList =
                                snapshot.data;
                            return FlutterFlowDropDown(
                              options: dropDownStoresRecordList
                                  .map((e) => valueOrDefault<String>(
                                        e.name,
                                        'null',
                                      ))
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownValue = val),
                              width: double.infinity,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Oswald',
                                    color: Colors.black,
                                  ),
                              hintText: 'Please select...',
                              icon: Icon(
                                Icons.store,
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: FlutterFlowTheme.of(context).links,
                              borderWidth: 0,
                              borderRadius: 0,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 0),
                                child: TextFormField(
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'textController1',
                                    Duration(milliseconds: 600),
                                    () => setState(() {}),
                                  ),
                                  controller: textController1,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'ad item\n',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
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
                                    color: enabled
                                        ? Colors.blue
                                        : Color(0xFFEEEEEE),
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
                                  updateCount: (count) => setState(
                                      () => countControllerValue = count),
                                  stepSize: 5,
                                  minimum: 5,
                                  maximum: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: TextFormField(
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController2',
                                  Duration(milliseconds: 600),
                                  () => setState(() {}),
                                ),
                                controller: textController2,
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
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: FaIcon(
                              FontAwesomeIcons.calendarAlt,
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
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
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
                                    imageUrl: textController2.text,
                                    width: double.infinity,
                                    height: 80,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      '«${dropDownValue}»‎  ',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Oswald',
                                            fontSize: 14,
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
                                  textController1.text,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Oswald',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        fontSize: 12,
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
                                        color:
                                            FlutterFlowTheme.of(context).links,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    StreamBuilder<List<StoresRecord>>(
                                      stream: queryStoresRecord(
                                        queryBuilder: (storesRecord) =>
                                            storesRecord.where('name',
                                                isEqualTo: dropDownValue),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .links,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<StoresRecord>
                                            textStoresRecordList =
                                            snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final textStoresRecord =
                                            textStoresRecordList.isNotEmpty
                                                ? textStoresRecordList.first
                                                : null;
                                        return AutoSizeText(
                                          textStoresRecord.storeAddress
                                              .maybeHandleOverflow(
                                            maxChars: 50,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Oswald',
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        );
                                      },
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
                                            color: FlutterFlowTheme.of(context)
                                                .dred,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Icon(
                                        Icons.card_giftcard_sharp,
                                        color:
                                            FlutterFlowTheme.of(context).dred,
                                        size: 21,
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
                            'Объявление будет активно с ',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                          Text(
                            dateTimeFormat('d/M/y', datePicked),
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: StreamBuilder<List<StoresRecord>>(
                      stream: queryStoresRecord(
                        queryBuilder: (storesRecord) => storesRecord
                            .where('name', isEqualTo: dropDownValue),
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
                                color: FlutterFlowTheme.of(context).links,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<StoresRecord> buttonStoresRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final buttonStoresRecord =
                            buttonStoresRecordList.isNotEmpty
                                ? buttonStoresRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            final adsCreateData = createAdsRecordData(
                              storeName: buttonStoresRecord.name,
                              adImage: textController2.text,
                              adItem: textController1.text,
                              adLocation: buttonStoresRecord.storeLocation,
                              adGiftsAmount: countControllerValue,
                              adAddress: buttonStoresRecord.storeAddress,
                              createdBy: currentUserReference,
                              activatingDate: datePicked,
                              owningStore: buttonStoresRecord.reference,
                            );
                            await AdsRecord.collection.doc().set(adsCreateData);
                          },
                          text: 'save',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: FlutterFlowTheme.of(context).links,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Oswald',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        );
                      },
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
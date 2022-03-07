import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAdWidget extends StatefulWidget {
  const AddAdWidget({Key key}) : super(key: key);

  @override
  _AddAdWidgetState createState() => _AddAdWidgetState();
}

class _AddAdWidgetState extends State<AddAdWidget> {
  DateTime datePicked;
  String uploadedFileUrl = '';
  TextEditingController textController1;
  int countControllerValue;
  TextEditingController adTag1Controller;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    adTag1Controller = TextEditingController();
    textController1 = TextEditingController();
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
                color: Color(0xFFE66F2D),
                size: 50,
              ),
            ),
          );
        }
        List<UsersRecord> addAdUsersRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).linksbuttons),
            automaticallyImplyLeading: true,
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                      suffixIcon: textController1
                                              .text.isNotEmpty
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.center,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Field is required';
                                      }

                                      return null;
                                    },
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.image_search,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    validateFileFormat(
                                        selectedMedia.storagePath, context)) {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  final downloadUrl = await uploadData(
                                      selectedMedia.storagePath,
                                      selectedMedia.bytes);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  if (downloadUrl != null) {
                                    setState(
                                        () => uploadedFileUrl = downloadUrl);
                                    showUploadMessage(
                                      context,
                                      'Success!',
                                    );
                                  } else {
                                    showUploadMessage(
                                      context,
                                      'Failed to upload media',
                                    );
                                    return;
                                  }
                                }
                              },
                            ),
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 200,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextFormField(
                                    controller: adTag1Controller,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'tag 1',
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
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.35,
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        uploadedFileUrl,
                                        width: 180,
                                        height: 120,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    spacing: 0,
                                    runSpacing: 0,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
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
                                                  FlutterFlowTheme.of(context)
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(32, 8, 32, 8),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final adsCreateData = {
                          ...createAdsRecordData(
                            adImage: uploadedFileUrl,
                            adItem: textController1.text,
                            adItemsAmmount: countControllerValue,
                            adActivatingDate: datePicked,
                            adOwner: currentUserReference,
                          ),
                          'ad_tags': [adTag1Controller.text],
                        };
                        await AdsRecord.collection.doc().set(adsCreateData);
                      },
                      text: 'save',
                      options: FFButtonOptions(
                        width: 80,
                        height: 40,
                        color: FlutterFlowTheme.of(context).linksbuttons,
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
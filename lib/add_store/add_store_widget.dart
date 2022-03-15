import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStoreWidget extends StatefulWidget {
  const AddStoreWidget({Key key}) : super(key: key);

  @override
  _AddStoreWidgetState createState() => _AddStoreWidgetState();
}

class _AddStoreWidgetState extends State<AddStoreWidget> {
  TextEditingController textController;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: StreamBuilder<List<StoresRecord>>(
                    stream: queryStoresRecord(
                      queryBuilder: (storesRecord) => storesRecord.where(
                          'store_owner',
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
                          return Slidable(
                            actionPane: const SlidableScrollActionPane(),
                            secondaryActions: [
                              IconSlideAction(
                                caption: 'Delete',
                                color: FlutterFlowTheme.of(context).dred,
                                icon: Icons.share,
                                onTap: () async {
                                  await listViewStoresRecord.reference.delete();
                                },
                              ),
                            ],
                            child: ListTile(
                              title: Text(
                                listViewStoresRecord.storeName,
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                listViewStoresRecord.storeAddress,
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    AuthUserStreamWidget(
                      child: Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 8, 32, 8),
                      child: TextFormField(
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Name of store',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.store_outlined,
                          ),
                          suffixIcon: textController.text.isNotEmpty
                              ? InkWell(
                                  onTap: () => setState(
                                    () => textController.clear(),
                                  ),
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 8, 32, 8),
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
                          width: double.infinity,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 8, 32, 8),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final storesCreateData = createStoresRecordData(
                            storeAddress: placePickerValue.address,
                            storeLocation: placePickerValue.latLng,
                            storeName: textController.text,
                            storeOwner: currentUserReference,
                            storeCity: placePickerValue.city,
                            storeStreet: placePickerValue.state,
                            storeCountry: placePickerValue.country,
                          );
                          await StoresRecord.collection
                              .doc()
                              .set(storesCreateData);
                        },
                        text: 'Add store',
                        options: FFButtonOptions(
                          width: double.infinity,
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
            ],
          ),
        ),
      ),
    );
  }
}

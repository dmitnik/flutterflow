import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingStoreWidget extends StatefulWidget {
  const AddingStoreWidget({Key key}) : super(key: key);

  @override
  _AddingStoreWidgetState createState() => _AddingStoreWidgetState();
}

class _AddingStoreWidgetState extends State<AddingStoreWidget> {
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
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AuthUserStreamWidget(
                child: Text(
                  currentUserDisplayName,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: '[Some hint text...]',
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
              ),
              FlutterFlowPlacePicker(
                iOSGoogleMapsApiKey: 'AIzaSyAfA44eDd6-qW_9MdJJIuGOke3Qx7wRmx0',
                androidGoogleMapsApiKey:
                    'AIzaSyBTdqV2OX-r25v3q-LBXz_Qij1IDGxcojg',
                webGoogleMapsApiKey: 'AIzaSyB9o0JFAWH7eU4-G8ULNKE82dIrwQg8H9k',
                onSelect: (place) => setState(() => placePickerValue = place),
                defaultText: 'Select Location',
                icon: Icon(
                  Icons.place,
                  color: Colors.white,
                  size: 16,
                ),
                buttonOptions: FFButtonOptions(
                  width: 200,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final storesCreateData = createStoresRecordData(
                      name: textController.text,
                      owner: currentUserReference,
                      storeAddress: placePickerValue.address,
                      storeLocation: placePickerValue.latLng,
                    );
                    await StoresRecord.collection.doc().set(storesCreateData);
                  },
                  text: 'Add store',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: StreamBuilder<List<StoresRecord>>(
                  stream: queryStoresRecord(
                    queryBuilder: (storesRecord) => storesRecord.where('owner',
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
                    List<StoresRecord> listViewStoresRecordList = snapshot.data;
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
                              listViewStoresRecord.name,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            subtitle: Text(
                              listViewStoresRecord.storeAddress,
                              style: FlutterFlowTheme.of(context).subtitle2,
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
            ],
          ),
        ),
      ),
    );
  }
}

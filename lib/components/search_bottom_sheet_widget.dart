import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBottomSheetWidget extends StatefulWidget {
  const SearchBottomSheetWidget({Key key}) : super(key: key);

  @override
  _SearchBottomSheetWidgetState createState() =>
      _SearchBottomSheetWidgetState();
}

class _SearchBottomSheetWidgetState extends State<SearchBottomSheetWidget> {
  List<String> checkboxGroupValues;
  TextEditingController searchOnMapController;

  @override
  void initState() {
    super.initState();
    searchOnMapController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              height: 15,
              thickness: 2,
              indent: 160,
              endIndent: 160,
              color: Color(0x98245288),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, -1),
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
                        labelText: 'Поиск',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 14,
                        ),
                        suffixIcon: searchOnMapController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => searchOnMapController.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 16,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Oswald',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FlutterFlowCheckboxGroup(
                    initiallySelected: checkboxGroupValues != null
                        ? checkboxGroupValues
                        : ['Все подарки'],
                    options: [
                      'Все подарки',
                      'Бесплатные услуги',
                      'Напитки',
                      'Еда'
                    ],
                    onChanged: (val) =>
                        setState(() => checkboxGroupValues = val),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    checkColor: Colors.white,
                    checkboxBorderColor: Color(0xFF95A1AC),
                    textStyle: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

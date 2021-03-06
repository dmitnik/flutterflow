import '../auth/auth_util.dart';
import '../components/my_gift_bottomsheet_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../user_account/user_account_widget.dart';
import '../user_login/user_login_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGiftsWidget extends StatefulWidget {
  const MyGiftsWidget({Key key}) : super(key: key);

  @override
  _MyGiftsWidgetState createState() => _MyGiftsWidgetState();
}

class _MyGiftsWidgetState extends State<MyGiftsWidget> {
  String choiceChipsValue;
  TextEditingController searchOnMapController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchOnMapController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryColor),
        automaticallyImplyLeading: true,
        title: Text(
          'My gifts',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: Container(
                            width: 80,
                            height: 80,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/253/600',
                            ),
                          ),
                        ),
                        Text(
                          'User Name',
                          style: FlutterFlowTheme.of(context).title2,
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserAccountWidget(),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                'Edit my account',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await signOut();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserLoginWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            child: ListTile(
                              title: Text(
                                'Logout',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                      prefixIcon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 24,
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
                                size: 24,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontSize: 14,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                child: FlutterFlowChoiceChips(
                  initiallySelected: [choiceChipsValue],
                  options: [
                    ChipData('Nearest', Icons.near_me),
                    ChipData('Ending soon', Icons.trending_down_rounded),
                    ChipData('Coffe', FontAwesomeIcons.coffee)
                  ],
                  onChanged: (val) =>
                      setState(() => choiceChipsValue = val.first),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).links,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          fontSize: 14,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryColor,
                    iconSize: 20,
                    elevation: 6,
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontSize: 14,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryColor,
                    iconSize: 20,
                    elevation: 2,
                  ),
                  chipSpacing: 8,
                  multiselect: false,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 4, 6, 4),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  child: MyGiftBottomsheetWidget(),
                                ),
                              );
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3,
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 0),
                                      child: SvgPicture.asset(
                                        'assets/images/logoipsum-logo-16.svg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 8, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '??Rumble Bumble Scramble Coffee?????  ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Oswald',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .links,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Icon(
                                                    Icons.card_giftcard_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: 24,
                                                  ),
                                                ),
                                                Text(
                                                  '?????? ?? ??????????????',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Oswald',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 0,
                                                  borderWidth: 0,
                                                  buttonSize: 40,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .mapMarkerAlt,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .links,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                                Text(
                                                  '200 ??',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Oswald',
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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

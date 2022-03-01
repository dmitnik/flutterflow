import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdBottomsheetWidget extends StatefulWidget {
  const AdBottomsheetWidget({
    Key key,
    this.adReference,
  }) : super(key: key);

  final AdsRecord adReference;

  @override
  _AdBottomsheetWidgetState createState() => _AdBottomsheetWidgetState();
}

class _AdBottomsheetWidgetState extends State<AdBottomsheetWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AdsRecord>(
      stream: AdsRecord.getDocument(widget.adReference.reference),
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
        final containerAdsRecord = snapshot.data;
        return Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://picsum.photos/seed/941/600',
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
                StreamBuilder<StoresRecord>(
                  stream: StoresRecord.getDocument(
                      widget.adReference.adOwningStore),
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
                    final columnStoresRecord = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          columnStoresRecord.storeName,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                        Text(
                          columnStoresRecord.storeAddress
                              .maybeHandleOverflow(maxChars: 50),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                        Text(
                          'осталось ',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Oswald',
                                    color: FlutterFlowTheme.of(context).dred,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              containerAdsRecord.adItemsAmmount.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Oswald',
                                    color: FlutterFlowTheme.of(context).dred,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                              child: Icon(
                                Icons.card_giftcard_sharp,
                                color: FlutterFlowTheme.of(context).dred,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          containerAdsRecord.adItem,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Oswald',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    );
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

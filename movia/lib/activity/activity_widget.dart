import '../components/activity_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({Key? key}) : super(key: key);

  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Activity',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ActivityCardWidget(
                    image:
                        'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/27Mj3rFYP3xqFy7lnz17vEd8Ms.jpg',
                    title: 'The Gray Man',
                    subtitle: 'relased in 07/13/2022 ',
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ActivityCardWidget(
                    image:
                        'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/AnfXhKJwb9rBa8cvPBV54XgJxMF.jpg',
                    title: 'Pantanal',
                    subtitle: 'E02 of S05 released.',
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ActivityCardWidget(
                    image:
                        'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/AfvIjhDu9p64jKcmohS4hsPG95Q.jpg',
                    title: 'The Black Phone ',
                    subtitle: 'relased in 07/13/2022 ',
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ActivityCardWidget(
                    image:
                        'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/sIRK4NYe1OK2hOJAg4xxuxzceKk.jpg',
                    title: '2 Good 2 Be True',
                    subtitle: 'E22 of S01 released.',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

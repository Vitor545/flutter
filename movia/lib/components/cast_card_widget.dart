import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CastCardWidget extends StatefulWidget {
  const CastCardWidget({
    Key? key,
    this.image,
    this.name,
  }) : super(key: key);

  final String? image;
  final String? name;

  @override
  _CastCardWidgetState createState() => _CastCardWidgetState();
}

class _CastCardWidgetState extends State<CastCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 112,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              valueOrDefault<String>(
                widget.image,
                'https://www.themoviedb.org/t/p/w276_and_h350_face/3bOGNsHlrswhyW79uvIHH1V43JI.jpg',
              ),
              width: 60,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: Text(
              valueOrDefault<String>(
                widget.name,
                'Chris Evans',
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

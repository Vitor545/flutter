import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeasonCardWidget extends StatefulWidget {
  const SeasonCardWidget({
    Key? key,
    this.name,
    this.year,
    this.numOfEpisodes,
    this.poster,
    this.overview,
  }) : super(key: key);

  final String? name;
  final int? year;
  final int? numOfEpisodes;
  final String? poster;
  final String? overview;

  @override
  _SeasonCardWidgetState createState() => _SeasonCardWidgetState();
}

class _SeasonCardWidgetState extends State<SeasonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                valueOrDefault<String>(
                  'https://www.themoviedb.org/t/p/w260_and_h390_bestv2${widget.poster}',
                  'https://www.themoviedb.org/t/p/w260_and_h390_bestv2/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
                ),
                width: 94,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name!,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).subtitle2,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      '${valueOrDefault<String>(
                        widget.year?.toString(),
                        '2022',
                      )} | ${widget.numOfEpisodes?.toString()} Episodes',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        widget.overview!,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: Icon(
              FFIcons.knameRightArrow2,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

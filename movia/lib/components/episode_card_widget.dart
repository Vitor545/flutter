import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EpisodeCardWidget extends StatefulWidget {
  const EpisodeCardWidget({
    Key? key,
    this.image,
    this.name,
    this.overview,
    this.relaseDate,
  }) : super(key: key);

  final String? image;
  final String? name;
  final String? overview;
  final String? relaseDate;

  @override
  _EpisodeCardWidgetState createState() => _EpisodeCardWidgetState();
}

class _EpisodeCardWidgetState extends State<EpisodeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 150,
            height: 84,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.image!,
                    width: 150,
                    height: 84,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 150,
                  height: 84,
                  decoration: BoxDecoration(
                    color: Color(0x27000000),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Icon(
                    FFIcons.knamePlay,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Text(
                      widget.name!,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Text(
                        widget.overview!,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ),
                  Text(
                    widget.relaseDate!,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

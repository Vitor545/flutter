import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget({
    Key? key,
    this.imagePath,
    this.title,
    this.duration,
    this.rating,
  }) : super(key: key);

  final String? imagePath;
  final String? title;
  final String? duration;
  final String? rating;

  @override
  _MovieCardWidgetState createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 224,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 115,
            height: 172,
            child: custom_widgets.ImdbImage(
              width: 115,
              height: 172,
              imagePath: widget.imagePath!,
              radious: 8.0,
              isPoster: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 8),
            child: Text(
              widget.title!,
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.duration!,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                  child: FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: FlutterFlowTheme.of(context).warning,
                    size: 12,
                  ),
                ),
                Text(
                  widget.rating!,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../movie_details/movie_details_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  ApiCallResponse? movies;
  TextEditingController? searchTextController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    searchTextController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 24),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: TextFormField(
                    controller: searchTextController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'searchTextController',
                      Duration(milliseconds: 500),
                      () async {
                        var _shouldSetState = false;
                        if (searchTextController!.text != null &&
                            searchTextController!.text != '') {
                          movies = await SearchMoviesCall.call(
                            query: searchTextController!.text,
                          );
                          _shouldSetState = true;
                        } else {
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search for movies, series...',
                      hintStyle: FlutterFlowTheme.of(context).bodyText1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        FFIcons.knameSearch,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
              if (searchTextController!.text == null ||
                  searchTextController!.text == '')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      Icon(
                        FFIcons.knameSearch,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 64,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: Text(
                          'Search in Movia',
                          style: FlutterFlowTheme.of(context).title2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 9, 0, 0),
                        child: Text(
                          'By typing in search box, Movia search in movies, series and actors then show you the best results. ',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              if (searchTextController!.text != null &&
                  searchTextController!.text != '')
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Builder(
                      builder: (context) {
                        final searMovies = getJsonField(
                          (movies?.jsonBody ?? ''),
                          r'''$.results''',
                        ).toList();
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.57,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: searMovies.length,
                          itemBuilder: (context, searMoviesIndex) {
                            final searMoviesItem = searMovies[searMoviesIndex];
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailsWidget(
                                      movieId: getJsonField(
                                        searMoviesItem,
                                        r'''$.id''',
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          'https://www.themoviedb.org/t/p/w1280/${getJsonField(
                                            searMoviesItem,
                                            r'''$.poster_path''',
                                          ).toString()}',
                                          'https://www.themoviedb.org/t/p/w1280/ox4goZd956BxqJH6iLwhWPL9ct4.jpg',
                                        ),
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        searMoviesItem,
                                        r'''$.title''',
                                      ).toString(),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

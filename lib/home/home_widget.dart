import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.rol, '') == 'admin') {
        context.pushNamed(
          'Admin',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        context.pushNamed(
          'Cliente',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.logout_sharp,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              context.goNamedAuth('PaginaPrincipal', context.mounted);
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (valueOrDefault(currentUserDocument?.rol, '') == 'cliente')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            _model.ratingBarPromedioValue?.toString(),
                            '1',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (valueOrDefault(currentUserDocument?.rol, '') == 'cliente')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            functions
                                .promedio(valueOrDefault<int>(
                                  _model.ratingBarPromedioValue?.round(),
                                  1,
                                ))
                                .toString(),
                            '1',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (valueOrDefault(currentUserDocument?.rol, '') == 'cliente')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          onRatingUpdate: (newValue) => safeSetState(
                              () => _model.ratingBarPromedioValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarPromedioValue ??= 1.0,
                          unratedColor: FlutterFlowTheme.of(context).accent1,
                          itemCount: 5,
                          itemSize: 30.0,
                          glowColor: FlutterFlowTheme.of(context).primary,
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          safeSetState(() => _model.ratingBarValue = newValue),
                      itemBuilder: (context, index) => FaIcon(
                        FontAwesomeIcons.solidAngry,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.ratingBarValue ??= 1.0,
                      unratedColor: FlutterFlowTheme.of(context).accent1,
                      itemCount: 5,
                      itemSize: 30.0,
                      glowColor: FlutterFlowTheme.of(context).primary,
                    ),
                  ],
                ),
              ),
              if (valueOrDefault(currentUserDocument?.rol, '') == 'admin')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Slider(
                          activeColor: FlutterFlowTheme.of(context).primary,
                          inactiveColor: FlutterFlowTheme.of(context).alternate,
                          min: 1.0,
                          max: 5.0,
                          value: _model.sliderValue ??= 1.0,
                          onChanged: (newValue) {
                            newValue =
                                double.parse(newValue.toStringAsFixed(2));
                            safeSetState(() => _model.sliderValue = newValue);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              if (valueOrDefault(currentUserDocument?.rol, '') == 'admin')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            _model.sliderValue?.toString(),
                            '1',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
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

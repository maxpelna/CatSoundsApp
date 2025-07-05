import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/coordinator/bloc/app_flow_cubit.dart';
import 'package:presentation/coordinator/flow/app_routes.dart';

final class AppFlowListenerPage extends StatelessWidget {
  const AppFlowListenerPage._();

  static Widget withBloc() => BlocProvider(
    create: (_) => AppFlowCubit()..refreshLaunchState(),
    child: AppFlowListenerPage._(),
  );

  @override
  Widget build(BuildContext context) => BlocListener<AppFlowCubit, AppFlowState>(
    listener: (context, state) {
      if (state is NotAuthenticatedState) {
        LoginPageRoute().go(context);
      } else if (state is AuthenticatedState) {
        HomePageRoute().go(context);
      }
    },
    listenWhen: (oldState, newState) => oldState != newState,
    child: const Scaffold(body: Center(child: CircularProgressIndicator())),
  );
}

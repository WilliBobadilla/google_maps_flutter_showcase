import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_showcase/core/ui/dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/injection_container/injection_container.dart';
import 'package:google_maps_showcase/features/street_view/presentation/views/guess_the_location_view.dart';
import 'package:google_maps_showcase/features/street_view/presentation/cubit/guess_the_location_form_cubit.dart';

class GuessTheLocationPage extends StatelessWidget {
  static const route = '/guessTheLocation';

  final GuessTheLocationPageParams params;

  GuessTheLocationPage({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GuessTheLocationFormCubit(getCurrentLocationUseCase: sl())
                ..onLoadTargetPosition(params.targetPosition),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GuessTheLocationFormCubit, GuessTheLocationFormState>(
            listener: (context, state) {
              developer.log("GuessTheLocationFormState changed: $state");
              if (state.failure?.message != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failure!.message!)),
                );
              }
              if (state.isCorrect == GuessLocationStatusEnum.correct) {
                showSuccessPopup(
                  context,
                  '¡Correcto!',
                  'Estuviste a ${state.distanceInMeters!.toStringAsFixed(0)} metros de distancia.',
                  onAccept: () {
                    context.read<GuessTheLocationFormCubit>().onClearAll();
                    Navigator.pop(context);
                  },
                );
              }
              if (state.isCorrect == GuessLocationStatusEnum.incorrect) {
                showSuccessPopup(
                  context,
                  'Intentelo de nuevo!',
                  'Estuviste a ${state.distanceInMeters!.toStringAsFixed(0)} metros de distancia.',
                  onAccept: () {
                    context.read<GuessTheLocationFormCubit>().onClearAll();
                    Navigator.pop(context);
                  },
                );
              }
            },
          ),
        ],
        child: const GuessTheLocationView(),
      ),
    );
  }
}

class GuessTheLocationPageParams {
  final LatLng targetPosition;

  GuessTheLocationPageParams({required this.targetPosition});
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_showcase/core/injection_container/injection_container.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/cubit/maps_form_cubit.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/views/maps_example_one_view.dart';

class MapsExampleOnePage extends StatelessWidget {
  static const route = '/mapsExampleOne';

  const MapsExampleOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapsFormCubit(getCurrentLocationUseCase: sl()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<MapsFormCubit, MapsFormState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
            },
          ),
        ],
        child: MapsExampleOneView(),
      ),
    );
  }
}

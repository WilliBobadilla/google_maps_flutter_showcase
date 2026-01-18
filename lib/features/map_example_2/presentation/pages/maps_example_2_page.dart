import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_showcase/core/cubits/injection_container.dart';
import 'package:google_maps_showcase/features/map_example_2/presentation/cubit/maps_2_form_cubit.dart';
import 'package:google_maps_showcase/features/map_example_2/presentation/views/maps_example_2_view.dart';

class MapsExample2Page extends StatelessWidget {
  static const route = '/mapsExampleTwo';

  const MapsExample2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Maps2FormCubit(getCurrentLocationUseCase: sl()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<Maps2FormCubit, Maps2FormState>(
            listener: (context, state) {
              developer.log("state is: $state");
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
            },
          ),
        ],
        child: const MapsExample2View(),
      ),
    );
  }
}

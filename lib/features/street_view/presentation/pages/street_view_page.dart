import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_showcase/core/constants_values/constants.dart';
import 'package:google_maps_showcase/core/cubits/injection_container.dart';
import 'package:google_maps_showcase/features/street_view/presentation/cubit/street_view_form_cubit.dart';
import 'package:google_maps_showcase/features/street_view/presentation/views/street_view_view.dart';

class StreetViewPage extends StatelessWidget {
  static const String route = "/street_view_page";
  const StreetViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StreetViewFormCubit(
            getRandomPlaceForStreetViewUseCase: sl(),
          )..onGetRandomLocation(), // we can call here for example a random location generator
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<StreetViewFormCubit, StreetViewFormState>(
            listener: (context, state) {
              if (state.failure?.message != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failure!.message!)),
                );
              }
            },
          ),
        ],
        child: StreetViewView(),
      ),
    );
  }
}

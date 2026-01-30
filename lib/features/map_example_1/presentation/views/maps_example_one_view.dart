import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/cubit/maps_form_cubit.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/widget/google_maps_wrapper_widget.dart';

class MapsExampleOneView extends StatelessWidget {
  const MapsExampleOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maps Example One')),
      body: const MapsFormWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            shape: const CircleBorder(),
            child: const Icon(Icons.change_circle),
            onPressed: () {
              context.read<MapsFormCubit>().onMapTypeChanged();
            },
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            child: const Icon(Icons.center_focus_strong),
            onPressed: () {
              // context.read<MapsFormCubit>().onCenterView();
              context.read<MapsFormCubit>().onReCenterPosition();
            },
          ),
        ],
      ),
    );
  }
}

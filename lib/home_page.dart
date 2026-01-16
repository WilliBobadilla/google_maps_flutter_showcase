import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_showcase/home_view.dart';
import 'package:google_maps_showcase/core/cubits/location_cubit/location_cubit.dart';
import 'package:google_maps_showcase/core/injection_container/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<LocationCubit>()..onRequestLocationPermission(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state.isPermissionGranted!) {
                //   context.read<LocationCubit>().onGetCurrentLocation();
              }
              if (state.failure != null) {
                final snackBar = SnackBar(
                  content: Text('Error: ${state.failure?.message ?? ''}'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
        ],
        child: HomeView(),
      ),
    );
  }
}

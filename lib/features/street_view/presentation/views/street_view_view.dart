import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/constants_values/constants.dart';
import 'package:google_maps_showcase/features/street_view/presentation/cubit/street_view_form_cubit.dart';
import 'package:google_maps_showcase/features/street_view/presentation/pages/guess_the_location_page.dart';

class StreetViewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Street View')),
      body: Stack(
        children: [
          WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..addJavaScriptChannel(
                'StreetViewChannel',
                onMessageReceived: (message) {
                  final data = jsonDecode(message.message);
                  final lat = data['lat'];
                  final lng = data['lng'];

                  print('Street View Position changed: Lat: $lat, Lng: $lng');
                },
              )
              ..loadHtmlString(
                context.watch<StreetViewFormCubit>().state.htmlForStreetView ??
                    streetViewHtml,
              ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: TextButton(
              child: const Text(
                'Adivinar',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                // this has to be a constant actually
                final location = context
                    .read<StreetViewFormCubit>()
                    .state
                    .location;
                print("ubicacion de street view: $location");
                if (location == null) return;
                Navigator.pushNamed(
                  context,
                  GuessTheLocationPage.route,
                  arguments: GuessTheLocationPageParams(
                    targetPosition: location,
                  ),
                );
                //go to guess the position
                // send the current location and match it with the street view position
              },
            ),
          ),
        ],
      ),
    );
  }
}

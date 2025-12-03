import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyWorkPage21 extends StatelessWidget {
  const MyWorkPage21({super.key});

  @override
  Widget build(BuildContext context) {
    return const MapSample();
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample>
    with AutomaticKeepAliveClientMixin<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  bool _cameraBusy = false;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Sample'),
        backgroundColor: const Color(0xFF1A237E),
      ),
      // Wrap the GoogleMap in a RepaintBoundary to reduce unnecessary repaints
      // and temporarily disable myLocation to reduce platform view overhead
      body: RepaintBoundary(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            // Guard against completing the completer more than once if the
            // widget is recreated rapidly.
            if (!_controller.isCompleted) {
              _controller.complete(controller);
            }
          },
          // disabled temporarily to reduce SurfaceTexture traffic while
          // diagnosing frequent BufferQueueProducer drops
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    if (!_controller.isCompleted) return;
    if (_cameraBusy) return; // simple throttle
    _cameraBusy = true;
    try {
      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    } catch (_) {
      // ignore animation errors
    } finally {
      // release throttle after short delay
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) setState(() => _cameraBusy = false);
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

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
  bool _myLocationEnabled = false;
  String? _error;

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
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                if (!_controller.isCompleted) {
                  _controller.complete(controller);
                }
              },
              myLocationEnabled: _myLocationEnabled,
              myLocationButtonEnabled: _myLocationEnabled,
            ),
            if (_error != null)
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Material(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      _error!,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: _showMyLocation,
            label: const Text('Tampilkan Lokasi Saya'),
            icon: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: _goToTheLake,
            label: const Text('To the lake'),
            icon: const Icon(Icons.directions_boat),
          ),
        ],
      ),
     );
    }

      Future<void> _showMyLocation() async {
        setState(() {
          _error = null;
        });
        try {
          bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!serviceEnabled) {
            setState(() {
              _error = 'Layanan lokasi tidak aktif. Aktifkan GPS/location di pengaturan.';
            });
            return;
          }
          LocationPermission permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
              setState(() {
                _error = 'Izin lokasi ditolak.';
              });
              return;
            }
          }
          if (permission == LocationPermission.deniedForever) {
            setState(() {
              _error = 'Izin lokasi ditolak permanen. Buka pengaturan aplikasi untuk mengaktifkan.';
            });
            return;
          }
          final pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          setState(() {
            _myLocationEnabled = true;
          });
          final GoogleMapController controller = await _controller.future;
          await controller.animateCamera(CameraUpdate.newLatLng(
            LatLng(pos.latitude, pos.longitude),
          ));
        } catch (e) {
          setState(() {
            _error = 'Gagal mendapatkan lokasi: $e';
          });
        }
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
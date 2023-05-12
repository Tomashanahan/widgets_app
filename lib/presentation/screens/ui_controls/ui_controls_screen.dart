import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'UiControlsScreen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, bus, plane, boat }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = false;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectedTransportation = Transportation.bike;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Change to developer mode'),
          value: isDeveloperMode,
          onChanged: (value) {
            setState(() {
              isDeveloperMode = !isDeveloperMode;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Tipo de vehículo'),
          initiallyExpanded: false,
          children: [
            RadioListTile(
              title: const Text('Bike mode'),
              subtitle: const Text('This is the bike'),
              value: Transportation.bike,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.bike;
                });
              },
              groupValue: selectedTransportation,
            ),
            RadioListTile(
              title: const Text('Car mode'),
              subtitle: const Text('This is the Car'),
              value: Transportation.car,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
              groupValue: selectedTransportation,
            ),
            RadioListTile(
              title: const Text('Bus mode'),
              subtitle: const Text('This is the Bus'),
              value: Transportation.bus,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.bus;
                });
              },
              groupValue: selectedTransportation,
            ),
            RadioListTile(
              title: const Text('Plane mode'),
              subtitle: const Text('This is the Plane'),
              value: Transportation.plane,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
              groupValue: selectedTransportation,
            ),
            RadioListTile(
              title: const Text('Boat mode'),
              subtitle: const Text('This is the Boat'),
              value: Transportation.boat,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
              groupValue: selectedTransportation,
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Incluir desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluir almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluir cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:soil_sensor/widgets/custom_char.dart';
import 'package:soil_sensor/widgets/linear.dart';
import 'package:soil_sensor/widgets/my_divider.dart';
import 'package:soil_sensor/widgets/temp_char.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final databaseReference = FirebaseDatabase.instance.ref('sensors');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: StreamBuilder(
            stream: databaseReference.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic data = snapshot.data!.snapshot.value;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        TempChar(
                          value: data['tem'],
                        ),
                        const CustomDivider(),
                        //hum
                        LinearView(
                          title: 'Humidity',
                          value: data['hum'],
                        ),
                        const CustomDivider(),
                        CustomChar(
                          value: data['soil_mositure'],
                          title: 'Soil Moisture',
                        ),
                        const CustomDivider(),
                         Icon(
                         data['ldr'] ? Icons.light_mode_outlined : Icons.dark_mode,
                          size: 100,
                          color: data['ldr'] ? Colors.deepOrangeAccent : Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                         Text(
                          'Light : ${data['ldr'] ? 'ON' : 'OFF'}',
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  );
                }
                else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.error}'),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox();
              }
          ),
        ),
      ),
    );
  }
}
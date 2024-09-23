import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DigitalPetApp(),
  ));
}

class DigitalPetApp extends StatefulWidget {
  @override
  _DigitalPetAppState createState() => _DigitalPetAppState();
}

class _DigitalPetAppState extends State<DigitalPetApp> {
  String petName = "Your Pet";
  int happinessLevel = 50;
  int hungerLevel = 50;
  int dirtyLevel = 0; // New dirty level
  final TextEditingController _nameController = TextEditingController();

  void _playWithPet() {
    setState(() {
      happinessLevel = (happinessLevel + 10).clamp(0, 100);
      hungerLevel = (hungerLevel + 5).clamp(0, 100);
      dirtyLevel = (dirtyLevel + 10).clamp(0, 100); // Increase dirty level
      _updateHappiness();
    });
  }

  void _feedPet() {
    setState(() {
      hungerLevel = (hungerLevel - 10).clamp(0, 100);
      dirtyLevel = (dirtyLevel + 5).clamp(0, 100); // Increase dirty level
      _updateHappiness();
    });
  }

  void _groomPet() {
    setState(() {
      dirtyLevel = (dirtyLevel - 20).clamp(0, 100); // Decrease dirty level
    });
  }

  void _trainPet() {
    setState(() {
      hungerLevel = (hungerLevel + 10).clamp(0, 100); // Increase hunger level
      // Happiness and dirty levels remain the same
    });
  }

  void _updateHappiness() {
    if (hungerLevel < 30) {
      happinessLevel = (happinessLevel - 20).clamp(0, 100);
    } else {
      happinessLevel = (happinessLevel + 10).clamp(0, 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Pet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Pet Name Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Pet Name',
                ),
                onSubmitted: (String value) {
                  setState(() {
                    petName = value.isEmpty ? "Your Pet" : value;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),

            Image.asset('assets/pet.png', width: 150, height: 150),

            SizedBox(height: 32.0),

            Text(
              'Name: $petName',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),

            Text(
              'Happiness Level: $happinessLevel',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),

            Text(
              'Hunger Level: $hungerLevel',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),

            Text(
              'Dirty Level: $dirtyLevel',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 32.0),

            ElevatedButton(
              onPressed: _playWithPet,
              child: Text('Play with Your Pet'),
            ),
            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: _feedPet,
              child: Text('Feed Your Pet'),
            ),
            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: _groomPet,
              child: Text('Groom Your Pet'),
            ),
            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: _trainPet,
              child: Text('Train Your Pet'),
            ),
          ],
        ),
      ),
    );
  }
}

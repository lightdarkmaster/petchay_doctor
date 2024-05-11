import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final TextEditingController _hectaresController = TextEditingController();
  String _result = '';

  void _calculate() {
    // Logic to calculate the amount based on hectares
    double hectares = double.tryParse(_hectaresController.text) ?? 0;
    // Example calculation (you can replace it with your own logic)
    double amount = hectares * 10; // Example calculation

    setState(() {
      _result = 'Amount of fertilizer or pesticides needed: $amount kg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate'),
      ),
      body: SingleChildScrollView(
        //height: 300, // Adjust the height as needed
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _hectaresController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter hectares',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 20),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                ),
                Image.asset(
                  'assets/images/calculate.gif', // Path to local image asset
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hectaresController.dispose();
    super.dispose();
  }
}

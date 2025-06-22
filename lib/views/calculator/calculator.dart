import 'package:flutter/material.dart';


class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0;

  void _calculate(String operation) {
    try {
      // Parse the input numbers
      final List<String> inputNumbers = _controller.text.split(',');
      final List<double> numbers = inputNumbers.map((e) => double.parse(e.trim())).toList();

      if (numbers.isEmpty) return;

      double result = numbers[0];
      for (int i = 1; i < numbers.length; i++) {
        switch (operation) {
          case 'add':
            result += numbers[i];
            break;
          case 'subtract':
            result -= numbers[i];
            break;
          case 'multiply':
            result *= numbers[i];
            break;
          case 'divide':
            result /= numbers[i];
            break;
        }
      }

      setState(() {
        _result = result;
      });
    } catch (e) {
      setState(() {
        _result = double.nan; // Display NaN if there is an error in parsing or calculation
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter numbers separated by commas',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('add'),
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('subtract'),
                  child: Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('multiply'),
                  child: Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('divide'),
                  child: Text('Divide'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

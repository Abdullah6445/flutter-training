import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExchangeRateScreen(),
    );
  }
}

class ExchangeRateScreen extends StatefulWidget {
  @override
  _ExchangeRateScreenState createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  String exchangeRate = '';
  bool isLoading = true;
  String errorMessage = '';
  final TextEditingController _usdController = TextEditingController();
  double convertedAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchExchangeRate();
  }

  Future<void> _fetchExchangeRate() async {
    final url =
        'https://api.currencyfreaks.com/latest?apikey=cd07fb2ec62e470b99fe8c8364732889&symbols=PKR';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rate = data['rates']['PKR'];

        if (rate != null) {
          setState(() {
            exchangeRate = rate.toString();
            isLoading = false;
          });
        } else {
          setState(() {
            errorMessage = 'Exchange rate data is unavailable';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          errorMessage = 'Failed to load exchange rate';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Something went wrong: $error';
        isLoading = false;
      });
    }
  }

  void _convertUSDToPKR() {
    if (_usdController.text.isNotEmpty && exchangeRate.isNotEmpty) {
      final usdAmount = double.tryParse(_usdController.text);
      final rate = double.tryParse(exchangeRate);
      if (usdAmount != null && rate != null) {
        setState(() {
          convertedAmount = usdAmount * rate;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('USD to PKR Exchange Rate')),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : errorMessage.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1 USD = $exchangeRate PKR',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _usdController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Enter amount in USD',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _convertUSDToPKR,
                          child: Text('Convert to PKR'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          _usdController.text.isEmpty
                              ? ''
                              : '${_usdController.text} USD = ${convertedAmount.toStringAsFixed(2)} PKR',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  )
                : Text(
                    errorMessage,
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
      ),
    );
  }
}

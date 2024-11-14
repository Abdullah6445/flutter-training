import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time CoinGecko Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoinListScreen(),
    );
  }
}

class CoinListScreen extends StatefulWidget {
  @override
  _CoinListScreenState createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  late StreamController<List<Coin>> _coinStreamController;
  late Stream<List<Coin>> _coinStream;

  @override
  void initState() {
    super.initState();
    // Initialize the stream controller and stream
    _coinStreamController = StreamController<List<Coin>>();
    _coinStream = _coinStreamController.stream;

    // Start periodic data fetching (every 10 seconds) using a stream
    _fetchRealTimeData();
  }

  // Fetch data from the CoinGecko API
  Future<void> fetchCoins() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Coin> coins = data.map((coin) => Coin.fromJson(coin)).toList();
      // Add the new coins list to the stream
      _coinStreamController.sink.add(coins);
    } else {
      throw Exception('Failed to load coins');
    }
  }

  // Fetch data and add it to the stream every 10 seconds
  void _fetchRealTimeData() {
    Timer.periodic(Duration(seconds: 10), (Timer t) {
      fetchCoins();
    });
  }

  @override
  void dispose() {
    _coinStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Cryptocurrency Prices'),
      ),
      body: StreamBuilder<List<Coin>>(
        stream: _coinStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final coin = snapshot.data![index];
                return ListTile(
                  title: Text(coin.name),
                  subtitle: Text('Price: \$${coin.price.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Coin {
  final String id;
  final String name;
  final double price;

  Coin({required this.id, required this.name, required this.price});

  // Factory method to create a Coin from JSON
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      name: json['name'],
      price: json['current_price'].toDouble(),
    );
  }
}

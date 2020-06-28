import 'package:buffetlocator/screens/home.dart';
import 'package:buffetlocator/services/abstract_data.dart';
import 'package:buffetlocator/services/mock_data_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(BuffetLocator());

class BuffetLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DataServiceAbstract>(
          create: (_) => MockDataService(),
        )
      ],
      child: MaterialApp(
        title: 'Buffet Locator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}

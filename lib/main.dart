import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterWebviewPlugin webviewplugin = FlutterWebviewPlugin();
  final fieldText = TextEditingController();
  void clearTextField() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.google.es",
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                webviewplugin.goBack();
              },
              icon: const Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () {
                webviewplugin.goForward();
              },
              icon: const Icon(Icons.arrow_forward)),
        ],
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
                onSubmitted: (url) => loadUrl(),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        clearTextField();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
                controller: fieldText),
          ),
        ),
      ),
    );
  }

  void loadUrl() {
    setState(() {
      webviewplugin
          .reloadUrl("https://www.google.com/search?q=" + fieldText.text);
    });
  }
}

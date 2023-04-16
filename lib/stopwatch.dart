import 'package:flutter/material.dart';
import 'dart:async';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  int _millisecondsElapsed = 0;
  bool _isRunning = false;
  Timer? _timer;
  List<String> _flags = [];

  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
    });
    if (_isRunning) {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _millisecondsElapsed += 10;
        });
      });
    } else {
      _timer?.cancel();
    }
  }

  void _resetTimer() {
    setState(() {
      _millisecondsElapsed = 0;
      _isRunning = false;
    });
    _timer?.cancel();
  }

  String _formatMilliseconds(int milliseconds) {
    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();
    final hours = (minutes / 60).truncate();
    return '${hours.toString().padLeft(2, '0')}:${(minutes % 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}.${(milliseconds % 1000).toString().padLeft(3, '0')}';
  }

  void _addFlag() {
    String time = _formatMilliseconds(_millisecondsElapsed);
    setState(() {
      _flags.add(time);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Stopwatch'),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: Container(
              child: Center(
            child: Column(
              children: [
                Text('Stopwatch',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  _formatMilliseconds(_millisecondsElapsed),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _toggleTimer();
                      },
                      child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _resetTimer();
                      },
                      child: Icon(Icons.stop),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _addFlag();
                      },
                      child: Icon(Icons.flag),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: _flags.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text('${index + 1}'),
                        title: Text(_flags[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Performance monitoring widget that displays FPS
/// Useful for debugging performance issues
class PerformanceMonitor extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const PerformanceMonitor({
    Key? key,
    required this.child,
    this.enabled = false,
  }) : super(key: key);

  @override
  State<PerformanceMonitor> createState() => _PerformanceMonitorState();
}

class _PerformanceMonitorState extends State<PerformanceMonitor> {
  double _fps = 0.0;
  Timer? _timer;
  int _frameCount = 0;
  DateTime _lastTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.enabled) {
      _startMonitoring();
    }
  }

  void _startMonitoring() {
    SchedulerBinding.instance.addPostFrameCallback(_onFrame);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          final now = DateTime.now();
          final elapsed = now.difference(_lastTime).inMilliseconds;
          _fps = (_frameCount * 1000.0) / elapsed;
          _frameCount = 0;
          _lastTime = now;
        });
      }
    });
  }

  void _onFrame(Duration timestamp) {
    if (!mounted) return;
    _frameCount++;
    SchedulerBinding.instance.addPostFrameCallback(_onFrame);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return Stack(
      children: [
        widget.child,
        Positioned(
          top: 50,
          right: 10,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _fps < 30
                    ? Colors.red.withOpacity(0.9)
                    : _fps < 50
                        ? Colors.orange.withOpacity(0.9)
                        : Colors.green.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _fps < 30
                        ? Icons.warning_amber_rounded
                        : Icons.speed_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'FPS: ${_fps.toStringAsFixed(1)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

/// Animated skeleton loader widget for showing loading states
class SkeletonLoader extends StatefulWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  const SkeletonLoader({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
                Colors.grey[300]!,
              ],
              stops: [
                (_animation.value - 0.3).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 0.3).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Skeleton loader for list tiles
class SkeletonListTile extends StatelessWidget {
  const SkeletonListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const SkeletonLoader(
            height: 50,
            width: 50,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoader(
                  height: 16,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 8),
                SkeletonLoader(
                  height: 14,
                  width: MediaQuery.of(context).size.width * 0.6,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Skeleton loader for card widgets
class SkeletonCard extends StatelessWidget {
  final double? height;
  const SkeletonCard({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.5,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 12),
            SkeletonLoader(
              height: 16,
              width: double.infinity,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            SkeletonLoader(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.7,
              borderRadius: BorderRadius.circular(4),
            ),
            if (height != null) SizedBox(height: height! - 100),
          ],
        ),
      ),
    );
  }
}

/// Skeleton loader for grid items
class SkeletonGridItem extends StatelessWidget {
  const SkeletonGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(
              height: 80,
              width: double.infinity,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 12),
            SkeletonLoader(
              height: 14,
              width: double.infinity,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            SkeletonLoader(
              height: 12,
              width: 80,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}

/// Loading screen with multiple skeleton cards
class SkeletonLoadingScreen extends StatelessWidget {
  final int itemCount;
  const SkeletonLoadingScreen({Key? key, this.itemCount = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const SkeletonCard(height: 150),
    );
  }
}

import 'package:flutter/material.dart';

/// Optimized list widget with better performance
class OptimizedList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context)? emptyBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final bool isLoading;
  final ScrollController? scrollController;
  final EdgeInsets? padding;
  final double? itemExtent; // For fixed height items (better performance)
  final ScrollPhysics? physics;

  const OptimizedList({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.isLoading = false,
    this.scrollController,
    this.padding,
    this.itemExtent,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingBuilder?.call(context) ??
          const Center(child: CircularProgressIndicator());
    }

    if (items.isEmpty) {
      return emptyBuilder?.call(context) ??
          const Center(child: Text('No items found'));
    }

    return ListView.builder(
      controller: scrollController,
      padding: padding ?? const EdgeInsets.all(8),
      itemCount: items.length,
      itemExtent: itemExtent, // Fixed height for better performance
      physics: physics,
      // Use addAutomaticKeepAlives: false for better memory management
      addAutomaticKeepAlives: false,
      // Use addRepaintBoundaries: true to cache widget renders
      addRepaintBoundaries: true,
      // Use addSemanticIndexes: false if you don't need accessibility
      addSemanticIndexes: false,
      itemBuilder: (context, index) {
        // Wrap in RepaintBoundary for better performance
        return RepaintBoundary(
          child: itemBuilder(context, items[index], index),
        );
      },
    );
  }
}

/// Paginated list for large datasets with lazy loading
class PaginatedList<T> extends StatefulWidget {
  final Future<List<T>> Function(int page, int pageSize) loadPage;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final int pageSize;
  final Widget Function(BuildContext context)? emptyBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final Widget Function(BuildContext context)? errorBuilder;
  final double? itemExtent;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;

  const PaginatedList({
    Key? key,
    required this.loadPage,
    required this.itemBuilder,
    this.pageSize = 20,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.itemExtent,
    this.padding,
    this.physics,
  }) : super(key: key);

  @override
  State<PaginatedList<T>> createState() => _PaginatedListState<T>();
}

class _PaginatedListState<T> extends State<PaginatedList<T>> {
  final List<T> _items = [];
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final newItems = await widget.loadPage(_currentPage, widget.pageSize);

      if (newItems.isEmpty) {
        _hasMore = false;
      } else {
        _items.addAll(newItems);
        _currentPage++;
      }
    } catch (e) {
      _hasError = true;
      debugPrint('Error loading page: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _refresh() async {
    _items.clear();
    _currentPage = 0;
    _hasMore = true;
    _hasError = false;
    await _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    // Initial loading state
    if (_items.isEmpty && _isLoading) {
      return widget.loadingBuilder?.call(context) ??
          const Center(child: CircularProgressIndicator());
    }

    // Error state
    if (_items.isEmpty && _hasError) {
      return widget.errorBuilder?.call(context) ??
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                const Text('Error loading data'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _refresh,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
    }

    // Empty state
    if (_items.isEmpty && !_isLoading) {
      return widget.emptyBuilder?.call(context) ??
          const Center(child: Text('No items found'));
    }

    // List with pagination
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        controller: _scrollController,
        padding: widget.padding ?? const EdgeInsets.all(8),
        itemCount: _items.length + (_hasMore ? 1 : 0),
        itemExtent: widget.itemExtent,
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: true,
        itemBuilder: (context, index) {
          // Loading indicator at the end
          if (index == _items.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return RepaintBoundary(
            child: widget.itemBuilder(context, _items[index], index),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

/// Optimized grid view with better performance
class OptimizedGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final Widget Function(BuildContext context)? emptyBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final bool isLoading;
  final ScrollController? scrollController;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;

  const OptimizedGridView({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.0,
    this.crossAxisSpacing = 8.0,
    this.mainAxisSpacing = 8.0,
    this.emptyBuilder,
    this.loadingBuilder,
    this.isLoading = false,
    this.scrollController,
    this.padding,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingBuilder?.call(context) ??
          const Center(child: CircularProgressIndicator());
    }

    if (items.isEmpty) {
      return emptyBuilder?.call(context) ??
          const Center(child: Text('No items found'));
    }

    return GridView.builder(
      controller: scrollController,
      padding: padding ?? const EdgeInsets.all(8),
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: items.length,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      itemBuilder: (context, index) {
        return RepaintBoundary(
          child: itemBuilder(context, items[index], index),
        );
      },
    );
  }
}

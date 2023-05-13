import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'InfiniteScrollScreen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));

    addFiveMoreIdImages();
    isLoading = false;

    if (!isMounted) false;

    setState(() {});
    moveScrollToBottom();
  }

  void addFiveMoreIdImages() {
    List<int> newIds = [];
    for (var i = 0; i < 5; i++) {
      newIds.add((imagesIds.last + 1) + i);
    }

    setState(() {
      imagesIds.addAll(newIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            Expanded(
              flex: 1,
              child: _ListViewBuilder(
                imagesIds: imagesIds,
                scrollController: scrollController,
                addFiveMoreIdImages: addFiveMoreIdImages,
                isMounted: isMounted,
              ),
            ),
            isLoading ? const _LoadingImagesIndicator() : const SizedBox()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    required this.imagesIds,
    required this.scrollController,
    required this.addFiveMoreIdImages,
    required this.isMounted,
  });

  final List<int> imagesIds;
  final ScrollController scrollController;
  final Function addFiveMoreIdImages;
  final bool isMounted;

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 4));

    final lastElement = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastElement + 1);
    addFiveMoreIdImages();

    if (!isMounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 10,
      onRefresh: () => onRefresh(),
      child: ListView.builder(
        itemCount: imagesIds.length,
        controller: scrollController,
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/Images/jar-loading.gif'),
            image: NetworkImage(
              'https://picsum.photos/id/${imagesIds[index]}/500/300',
            ),
          );
        },
      ),
    );
  }
}

class _LoadingImagesIndicator extends StatelessWidget {
  const _LoadingImagesIndicator();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 30,
      left: MediaQuery.of(context).size.width * 0.45,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}



// Future cargandoNoticiasPropias({required bool isLoading,}) async {

//     bool isLoading =
//         Provider.of<ControlListViewProvider>(context, listen: false)
//             .getLoadingMoreTweets;

//     if (isLoading) return;
//     Provider.of<ControlListViewProvider>(context, listen: false)
//         .setLoadingMoreTweets = true;

//     await Future.delayed(const Duration(milliseconds: 800));

//     if (_scrollController.position.pixels + 100 <=
//         _scrollController.position.maxScrollExtent) return;

//     _scrollController.animateTo(
//       _scrollController.position.pixels + 200,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.fastOutSlowIn,
//     );

//     Provider.of<ControlListViewProvider>(context, listen: false)
//         .setLoadingMoreTweets = false;
//   } 
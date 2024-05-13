// class PostListView extends StatefulWidget {
//   const PostListView({Key? key}) : super(key: key);

//   @override
//   _PostListViewState createState() => _PostListViewState();
// }

// class _PostListViewState extends State<PostListView>
//     with AutomaticKeepAliveClientMixin {
//   final PagingController<int, PostData> _postPagingController =
//       PagingController(firstPageKey: 1);

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void initState() {
//     super.initState();
//     _postPagingController.addPageRequestListener((pageKey) {
//       BlocProvider.of<GetpostBloc>(context).add(
//         GetPostDatailes(page: pageKey.toString()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // Required for AutomaticKeepAliveClientMixin

//     return BlocListener<GetpostBloc, GetpostState>(
//       listener: (context, state) {
//         if (!state.isLoading) {
//           final records = state.posteModel?.data ?? [];
//           final isLastPage = records.length < 10;
//           final currentapage = state.posteModel?.currentPage;

//           if (isLastPage && currentapage == 1) {
//             _postPagingController.itemList?.clear();
//             _postPagingController.appendLastPage(records);
//           } else if (currentapage == 1) {
//             _postPagingController.itemList?.clear();
//             final nextPageKey = currentapage! + 1;
//             _postPagingController.appendPage(records, nextPageKey);
//           } else if (isLastPage) {
//             _postPagingController.appendLastPage(records);
//           } else {
//             final nextPageKey = currentapage! + 1;
//             _postPagingController.appendPage(records, nextPageKey);
//           }
//         }

//         if (state.iserro) {
//           _postPagingController.error = state.iserro;
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(top: 8.0),
//         child: BlocBuilder<GetpostBloc, GetpostState>(
//           builder: (context, state) {
//             return RefreshIndicator(
//               onRefresh: () async {
//                 BlocProvider.of<GetpostBloc>(context).add(
//                   GetPostDatailes(page: '1'),
//                 );
//               },
//               child: PagedMasonryGridView<int, PostData>(
//                 gridDelegateBuilder: (childCount) {
//                   return const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 200);
//                 },
//                 key: const PageStorageKey<String>('page'),
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 mainAxisSpacing: 12.0,
//                 crossAxisSpacing: 12.0,
//                 cacheExtent: 9999,
//                 pagingController: _postPagingController,
//                 addAutomaticKeepAlives: true,
//                 builderDelegate: PagedChildBuilderDelegate<PostData>(
//                   firstPageProgressIndicatorBuilder: (_) => const Center(
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   ),
//                   noItemsFoundIndicatorBuilder: (_) => const NoPostFound(),
//                   newPageProgressIndicatorBuilder: (_) => const SizedBox(),
//                   firstPageErrorIndicatorBuilder: (_) => ErrorScreens(
//                     isbuttonShow: true,
//                     onTap: () {
//                       retry(context);
//                     },
//                   ),
//                   itemBuilder: (context, post, index) => NewWidget(
//                     imageHight: double.parse(" ${post.image?[0].height ?? 0}"),
//                     post: post,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
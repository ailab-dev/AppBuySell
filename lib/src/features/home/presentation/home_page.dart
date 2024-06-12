import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/app_list_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appProvider = ref.watch(appListProvider);
    ref.read(appListProvider.notifier).updateFcmToken();

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.push('/user-profile',
                            extra: FirebaseAuth.instance.currentUser?.uid);
                      },
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            FirebaseAuth.instance.currentUser?.photoURL ?? ''),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context.push('/notification');
                        },
                        icon: const Icon(Icons.notifications_outlined))
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromRGBO(240, 240, 240, 1),
              height: 1,
            ),
            Expanded(
              child: appProvider.when(
                data: (data) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return InkWell(
                        onTap: () {
                          context.push('/product', extra: item.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Row(
                            children: [
                              Ink(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          item.iconUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      color: ColorsConstant.text,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item.description,
                                    style: const TextStyle(
                                      color: ColorsConstant.text,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                  );
                },
                error: (error, stackTrace) {
                  return Text('Error: $error');
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          final didUpload = await context.push('/upload-app');
          if (didUpload is bool && didUpload && context.mounted) {
            ref.read(appListProvider.notifier).getApps();
          }
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            ColorsConstant.purple,
          ),
        ),
      ),
    );
  }
}

import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/my_profile/provider/my_profile_privder.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfilePage extends HookConsumerWidget {
  const MyProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(myProfileProvider);
    userProvider.when(
      data: (data) {},
      error: (Object error, StackTrace stackTrace) {
        Utils.showAlertError(context: context, error: error);
      },
      loading: () {},
    );
    return Scaffold(
      appBar: AppBar(),
      body: LoadingView(
        isLoading: userProvider.isLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userProvider.value?.userName ?? '',
                      style: const TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: const BorderSide(
                              color: ColorsConstant.text,
                            ),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.images.editSquare.svg(),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '編集',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.text,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _checkEmpty(userProvider.value?.nickName)
                      ? ''
                      : '@${userProvider.value?.nickName ?? ''}',
                  style: const TextStyle(
                    color: ColorsConstant.text,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                color: ColorsConstant.gray,
                endIndent: 0,
                indent: 0,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  userProvider.value?.description ?? '',
                  style: const TextStyle(
                    color: ColorsConstant.text,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'SNS・リンク',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorsConstant.text,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Assets.images.x.svg(),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      _checkEmpty(userProvider.value?.twitter)
                          ? ''
                          : '@${userProvider.value?.twitter ?? ''}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.gray3,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Assets.images.facebook.svg(),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      _checkEmpty(userProvider.value?.facebook)
                          ? ''
                          : '@${userProvider.value?.facebook ?? ''}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.gray3,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Assets.images.instagram.image(),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      _checkEmpty(userProvider.value?.instagram)
                          ? ''
                          : '@${userProvider.value?.instagram ?? ''}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.gray3,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Assets.images.github.svg(),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      _checkEmpty(userProvider.value?.github)
                          ? ''
                          : '@${userProvider.value?.github ?? ''}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.gray3,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Assets.images.portfolio.svg(),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      userProvider.value?.portfolio ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.gray3,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _checkEmpty(String? text) {
    if (text != null && text.trim().isNotEmpty) {
      return false;
    }
    return true;
  }
}

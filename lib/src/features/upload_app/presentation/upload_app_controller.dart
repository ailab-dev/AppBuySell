import 'dart:io';

import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/upload_app/domain/upload_app_model.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_app_controller.g.dart';

@riverpod
class UploadAppController extends _$UploadAppController {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  UploadAppModel build() {
    final model = UploadAppModel(
      currentPage: 0,
      nextPage: false,
      backPage: false,
      screenshots: [],
      avatarPath: '',
      appName: '',
      description: '',
      price: '',
      appStoreUrl: '',
      gPlayUrl: '',
      storeValidate: false,
      appInfoValidate: false,
      appImageValidate: true,
      appPriceValidate: false,
      appCatchphrase: '',
      nameLength: 0,
      catchphraseLength: 0,
      descriptionLength: 0,
      didUpload: false,
      isUploading: false,
    );
    return model;
  }

  void setCurrentPage(int index) {
    state = state.copyWith(currentPage: index);
  }

  void nextPage() {
    state = state.copyWith(nextPage: true);
    state = state.copyWith(nextPage: false);
  }

  void backPage() {
    state = state.copyWith(backPage: true);
    state = state.copyWith(backPage: false);
  }

  void setAppstoreUrl(String url) {
    if (url.trim().isEmpty) {
      state = state.copyWith(appStoreUrl: url, storeValidate: false);
    } else {
      state = state.copyWith(appStoreUrl: url, storeValidate: true);
    }
  }

  void setAppName(String value) {
    state = state.copyWith(appName: value, nameLength: value.length);
    _validateAppInfo();
  }

  void setAppCatchphrase(String value) {
    state =
        state.copyWith(appCatchphrase: value, catchphraseLength: value.length);
    _validateAppInfo();
  }

  void setAppDescription(String value) {
    state = state.copyWith(description: value, descriptionLength: value.length);
    _validateAppInfo();
  }

  void setAppCategory(CategoryType value) {
    state = state.copyWith(categoryType: value);
    _validateAppInfo();
  }

  void _validateAppInfo() {
    if (state.appName.trim().isNotEmpty &&
        state.appCatchphrase.trim().isNotEmpty &&
        state.description.trim().isNotEmpty &&
        state.categoryType != null) {
      state = state.copyWith(appInfoValidate: true);
    } else {
      state = state.copyWith(appInfoValidate: false);
    }
  }

  void setAppPrice(String value) {
    state = state.copyWith(price: value);

    try {
      final priceValue = int.parse(state.priceValue);
      if (priceValue > 0) {
        state = state.copyWith(appPriceValidate: true);
      } else {
        state = state.copyWith(appPriceValidate: false);
      }
    } catch (_) {
      state = state.copyWith(appPriceValidate: false);
    }
  }

  void setAvatar() async {
    final xFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (xFile != null) {
      state = state.copyWith(avatarPath: xFile.path);
      _validateAppImage();
    }
  }

  void addScreenShots() async {
    List<String> screenshots = List.from(state.screenshots).cast();
    final files = await _imagePicker.pickMultiImage(imageQuality: 50);
    for (final e in files) {
      screenshots.add(e.path);
    }
    state = state.copyWith(screenshots: screenshots);
    _validateAppImage();
  }

  void removeScreenshot(int index) {
    List<String> screenshots = List.from(state.screenshots).cast();
    screenshots.removeAt(index);
    state = state.copyWith(screenshots: screenshots);
    _validateAppImage();
  }

  void _validateAppImage() {
    if (state.avatarPath.isNotEmpty && state.screenshots.length >= 3) {
      state = state.copyWith(appImageValidate: true);
    } else {
      state = state.copyWith(appImageValidate: false);
    }
  }

  CollectionReference<AppModel> get _appRef {
    return FirebaseFirestore.instance.collection('apps').withConverter(
          fromFirestore: (snapshot, _) => AppModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  Future<void> uploadApp() async {
    state = state.copyWith(isUploading: true);
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    final doc = _appRef.doc();
    List<String> imageUrl = [];
    final storageRef = FirebaseStorage.instance.ref();
    await Future.forEach(state.screenshots, (imagePath) async {
      final imageRef =
          storageRef.child(uid).child(doc.id).child(Utils.random());
      await imageRef.putFile(
        File(imagePath),
        SettableMetadata(
          contentType: "image/jpeg",
        ),
      );
      final downloadUrl = await imageRef.getDownloadURL();
      imageUrl.add(downloadUrl);
    });
    final avatarRef = storageRef.child(uid).child(doc.id).child(Utils.random());
    await avatarRef.putFile(
      File(state.avatarPath),
      SettableMetadata(
        contentType: "image/jpeg",
      ),
    );
    final avatarUrl = await avatarRef.getDownloadURL();
    final appModel = AppModel(
      name: state.appName,
      description: state.description,
      iconUrl: avatarUrl,
      price: state.priceValue,
      id: doc.id,
      banner: imageUrl,
      createdAt: DateTime.now(),
      ownerId: uid,
      appStoreUrl: state.appStoreUrl,
      catchphrase: state.appCatchphrase,
      categoryType: state.categoryType,
    );
    await doc.set(appModel);
    state = state.copyWith(didUpload: true);
  }
}

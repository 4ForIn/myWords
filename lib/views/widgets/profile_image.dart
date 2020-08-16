import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ProfileImgViewModel>(
      converter: (Store<AppState> store) =>
          _ProfileImgViewModel.fromStore(store),
      builder: (BuildContext context, _ProfileImgViewModel vm) =>
          GestureDetector(
        onTap: vm.updatePhotoFn,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
            color: AppTheme.topBarBackgroundColor,
          ),
          child: (vm.photoUrl != null && vm.photoUrl != '')
              ? Image.network(
                  vm.photoUrl,
                  width: 11 * SizeConfig.imageSizeMultiplier,
                  height: 11 * SizeConfig.imageSizeMultiplier,
                  fit: BoxFit.scaleDown,
                )
              : Image.asset(
                  Images.userAvatar,
                  width: 11 * SizeConfig.imageSizeMultiplier,
                  height: 11 * SizeConfig.imageSizeMultiplier,
                  fit: BoxFit.scaleDown,
                ),
        ),
      ),
    );
  }
}

typedef ViewModelFn = Function();

class _ProfileImgViewModel {
  final ViewModelFn updatePhotoFn;
  final String photoUrl;

  _ProfileImgViewModel({
    this.updatePhotoFn,
    this.photoUrl,
  });

  // ignore: prefer_constructors_over_static_methods
  static _ProfileImgViewModel fromStore(Store<AppState> store) {
    return _ProfileImgViewModel(
      updatePhotoFn: () => store.dispatch(FakeAction),
      photoUrl: store.state.currentUser.userImageUrl,
    );
  }
}

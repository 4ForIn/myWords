// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

// ignore: unused_element
  _HomePageState call(
      {String selectedTab,
      String selectLanguageRadioListGrVal,
      GlobalKey<ScaffoldState> homePageScaffoldKey,
      BuildContext homePageContext}) {
    return _HomePageState(
      selectedTab: selectedTab,
      selectLanguageRadioListGrVal: selectLanguageRadioListGrVal,
      homePageScaffoldKey: homePageScaffoldKey,
      homePageContext: homePageContext,
    );
  }
}

// ignore: unused_element
const $HomePageState = _$HomePageStateTearOff();

mixin _$HomePageState {
  String get selectedTab;
  String get selectLanguageRadioListGrVal;
  GlobalKey<ScaffoldState> get homePageScaffoldKey;
  BuildContext get homePageContext;

  $HomePageStateCopyWith<HomePageState> get copyWith;
}

abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
  $Res call(
      {String selectedTab,
      String selectLanguageRadioListGrVal,
      GlobalKey<ScaffoldState> homePageScaffoldKey,
      BuildContext homePageContext});
}

class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;

  @override
  $Res call({
    Object selectedTab = freezed,
    Object selectLanguageRadioListGrVal = freezed,
    Object homePageScaffoldKey = freezed,
    Object homePageContext = freezed,
  }) {
    return _then(_value.copyWith(
      selectedTab:
          selectedTab == freezed ? _value.selectedTab : selectedTab as String,
      selectLanguageRadioListGrVal: selectLanguageRadioListGrVal == freezed
          ? _value.selectLanguageRadioListGrVal
          : selectLanguageRadioListGrVal as String,
      homePageScaffoldKey: homePageScaffoldKey == freezed
          ? _value.homePageScaffoldKey
          : homePageScaffoldKey as GlobalKey<ScaffoldState>,
      homePageContext: homePageContext == freezed
          ? _value.homePageContext
          : homePageContext as BuildContext,
    ));
  }
}

abstract class _$HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(
          _HomePageState value, $Res Function(_HomePageState) then) =
      __$HomePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String selectedTab,
      String selectLanguageRadioListGrVal,
      GlobalKey<ScaffoldState> homePageScaffoldKey,
      BuildContext homePageContext});
}

class __$HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(
      _HomePageState _value, $Res Function(_HomePageState) _then)
      : super(_value, (v) => _then(v as _HomePageState));

  @override
  _HomePageState get _value => super._value as _HomePageState;

  @override
  $Res call({
    Object selectedTab = freezed,
    Object selectLanguageRadioListGrVal = freezed,
    Object homePageScaffoldKey = freezed,
    Object homePageContext = freezed,
  }) {
    return _then(_HomePageState(
      selectedTab:
          selectedTab == freezed ? _value.selectedTab : selectedTab as String,
      selectLanguageRadioListGrVal: selectLanguageRadioListGrVal == freezed
          ? _value.selectLanguageRadioListGrVal
          : selectLanguageRadioListGrVal as String,
      homePageScaffoldKey: homePageScaffoldKey == freezed
          ? _value.homePageScaffoldKey
          : homePageScaffoldKey as GlobalKey<ScaffoldState>,
      homePageContext: homePageContext == freezed
          ? _value.homePageContext
          : homePageContext as BuildContext,
    ));
  }
}

class _$_HomePageState with DiagnosticableTreeMixin implements _HomePageState {
  const _$_HomePageState(
      {this.selectedTab,
      this.selectLanguageRadioListGrVal,
      this.homePageScaffoldKey,
      this.homePageContext});

  @override
  final String selectedTab;
  @override
  final String selectLanguageRadioListGrVal;
  @override
  final GlobalKey<ScaffoldState> homePageScaffoldKey;
  @override
  final BuildContext homePageContext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomePageState(selectedTab: $selectedTab, selectLanguageRadioListGrVal: $selectLanguageRadioListGrVal, homePageScaffoldKey: $homePageScaffoldKey, homePageContext: $homePageContext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomePageState'))
      ..add(DiagnosticsProperty('selectedTab', selectedTab))
      ..add(DiagnosticsProperty(
          'selectLanguageRadioListGrVal', selectLanguageRadioListGrVal))
      ..add(DiagnosticsProperty('homePageScaffoldKey', homePageScaffoldKey))
      ..add(DiagnosticsProperty('homePageContext', homePageContext));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomePageState &&
            (identical(other.selectedTab, selectedTab) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTab, selectedTab)) &&
            (identical(other.selectLanguageRadioListGrVal,
                    selectLanguageRadioListGrVal) ||
                const DeepCollectionEquality().equals(
                    other.selectLanguageRadioListGrVal,
                    selectLanguageRadioListGrVal)) &&
            (identical(other.homePageScaffoldKey, homePageScaffoldKey) ||
                const DeepCollectionEquality()
                    .equals(other.homePageScaffoldKey, homePageScaffoldKey)) &&
            (identical(other.homePageContext, homePageContext) ||
                const DeepCollectionEquality()
                    .equals(other.homePageContext, homePageContext)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedTab) ^
      const DeepCollectionEquality().hash(selectLanguageRadioListGrVal) ^
      const DeepCollectionEquality().hash(homePageScaffoldKey) ^
      const DeepCollectionEquality().hash(homePageContext);

  @override
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {String selectedTab,
      String selectLanguageRadioListGrVal,
      GlobalKey<ScaffoldState> homePageScaffoldKey,
      BuildContext homePageContext}) = _$_HomePageState;

  @override
  String get selectedTab;
  @override
  String get selectLanguageRadioListGrVal;
  @override
  GlobalKey<ScaffoldState> get homePageScaffoldKey;
  @override
  BuildContext get homePageContext;
  @override
  _$HomePageStateCopyWith<_HomePageState> get copyWith;
}

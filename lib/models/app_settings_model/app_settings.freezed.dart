// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

class _$AppSettingsTearOff {
  const _$AppSettingsTearOff();

// ignore: unused_element
  _AppSettings call(
      {String isDarkMode,
      String loginPageState,
      String selectLanguageRadioListGrVal,
      String selectedTab}) {
    return _AppSettings(
      isDarkMode: isDarkMode,
      loginPageState: loginPageState,
      selectLanguageRadioListGrVal: selectLanguageRadioListGrVal,
      selectedTab: selectedTab,
    );
  }
}

// ignore: unused_element
const $AppSettings = _$AppSettingsTearOff();

mixin _$AppSettings {
  String get isDarkMode;
  String get loginPageState;
  String get selectLanguageRadioListGrVal;
  String get selectedTab;

  Map<String, dynamic> toJson();
  $AppSettingsCopyWith<AppSettings> get copyWith;
}

abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res>;
  $Res call(
      {String isDarkMode,
      String loginPageState,
      String selectLanguageRadioListGrVal,
      String selectedTab});
}

class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  final AppSettings _value;
  // ignore: unused_field
  final $Res Function(AppSettings) _then;

  @override
  $Res call({
    Object isDarkMode = freezed,
    Object loginPageState = freezed,
    Object selectLanguageRadioListGrVal = freezed,
    Object selectedTab = freezed,
  }) {
    return _then(_value.copyWith(
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as String,
      loginPageState: loginPageState == freezed
          ? _value.loginPageState
          : loginPageState as String,
      selectLanguageRadioListGrVal: selectLanguageRadioListGrVal == freezed
          ? _value.selectLanguageRadioListGrVal
          : selectLanguageRadioListGrVal as String,
      selectedTab:
          selectedTab == freezed ? _value.selectedTab : selectedTab as String,
    ));
  }
}

abstract class _$AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(
          _AppSettings value, $Res Function(_AppSettings) then) =
      __$AppSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String isDarkMode,
      String loginPageState,
      String selectLanguageRadioListGrVal,
      String selectedTab});
}

class __$AppSettingsCopyWithImpl<$Res> extends _$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(
      _AppSettings _value, $Res Function(_AppSettings) _then)
      : super(_value, (v) => _then(v as _AppSettings));

  @override
  _AppSettings get _value => super._value as _AppSettings;

  @override
  $Res call({
    Object isDarkMode = freezed,
    Object loginPageState = freezed,
    Object selectLanguageRadioListGrVal = freezed,
    Object selectedTab = freezed,
  }) {
    return _then(_AppSettings(
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as String,
      loginPageState: loginPageState == freezed
          ? _value.loginPageState
          : loginPageState as String,
      selectLanguageRadioListGrVal: selectLanguageRadioListGrVal == freezed
          ? _value.selectLanguageRadioListGrVal
          : selectLanguageRadioListGrVal as String,
      selectedTab:
          selectedTab == freezed ? _value.selectedTab : selectedTab as String,
    ));
  }
}

@JsonSerializable()
class _$_AppSettings with DiagnosticableTreeMixin implements _AppSettings {
  const _$_AppSettings(
      {this.isDarkMode,
      this.loginPageState,
      this.selectLanguageRadioListGrVal,
      this.selectedTab});

  factory _$_AppSettings.fromJson(Map<String, dynamic> json) =>
      _$_$_AppSettingsFromJson(json);

  @override
  final String isDarkMode;
  @override
  final String loginPageState;
  @override
  final String selectLanguageRadioListGrVal;
  @override
  final String selectedTab;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppSettings(isDarkMode: $isDarkMode, loginPageState: $loginPageState, selectLanguageRadioListGrVal: $selectLanguageRadioListGrVal, selectedTab: $selectedTab)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppSettings'))
      ..add(DiagnosticsProperty('isDarkMode', isDarkMode))
      ..add(DiagnosticsProperty('loginPageState', loginPageState))
      ..add(DiagnosticsProperty(
          'selectLanguageRadioListGrVal', selectLanguageRadioListGrVal))
      ..add(DiagnosticsProperty('selectedTab', selectedTab));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppSettings &&
            (identical(other.isDarkMode, isDarkMode) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkMode, isDarkMode)) &&
            (identical(other.loginPageState, loginPageState) ||
                const DeepCollectionEquality()
                    .equals(other.loginPageState, loginPageState)) &&
            (identical(other.selectLanguageRadioListGrVal,
                    selectLanguageRadioListGrVal) ||
                const DeepCollectionEquality().equals(
                    other.selectLanguageRadioListGrVal,
                    selectLanguageRadioListGrVal)) &&
            (identical(other.selectedTab, selectedTab) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTab, selectedTab)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isDarkMode) ^
      const DeepCollectionEquality().hash(loginPageState) ^
      const DeepCollectionEquality().hash(selectLanguageRadioListGrVal) ^
      const DeepCollectionEquality().hash(selectedTab);

  @override
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppSettingsToJson(this);
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {String isDarkMode,
      String loginPageState,
      String selectLanguageRadioListGrVal,
      String selectedTab}) = _$_AppSettings;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$_AppSettings.fromJson;

  @override
  String get isDarkMode;
  @override
  String get loginPageState;
  @override
  String get selectLanguageRadioListGrVal;
  @override
  String get selectedTab;
  @override
  _$AppSettingsCopyWith<_AppSettings> get copyWith;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharedPrefs _$$_SharedPrefsFromJson(Map<String, dynamic> json) =>
    _$_SharedPrefs(
      id: json['id'] as int? ?? autoIncrementId,
      isFirstLaunch: json['isFirstLaunch'] as bool? ?? true,
    );

Map<String, dynamic> _$$_SharedPrefsToJson(_$_SharedPrefs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isFirstLaunch': instance.isFirstLaunch,
    };

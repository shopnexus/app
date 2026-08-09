// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_scans.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IdentityScansCWProxy {
  IdentityScans back(Resource? back);
  IdentityScans front(Resource? front);
  IdentityScans selfie(Resource? selfie);

  IdentityScans call({
    Resource? back,
    Resource? front,
    Resource? selfie,
  });
}

class _$IdentityScansCWProxyImpl implements _$IdentityScansCWProxy {
  final IdentityScans _value;

  const _$IdentityScansCWProxyImpl(this._value);

  @override
  IdentityScans back(Resource? back) => this(back: back);

  @override
  IdentityScans front(Resource? front) => this(front: front);

  @override
  IdentityScans selfie(Resource? selfie) => this(selfie: selfie);

  @override
  IdentityScans call({
    Object? back = const $CopyWithPlaceholder(),
    Object? front = const $CopyWithPlaceholder(),
    Object? selfie = const $CopyWithPlaceholder(),
  }) {
    return IdentityScans(
      back: back == const $CopyWithPlaceholder()
          ? _value.back
          : back as Resource?,
      front: front == const $CopyWithPlaceholder()
          ? _value.front
          : front as Resource?,
      selfie: selfie == const $CopyWithPlaceholder()
          ? _value.selfie
          : selfie as Resource?,
    );
  }
}

extension IdentityScansCopyWith on IdentityScans {
  _$IdentityScansCWProxy get copyWith => _$IdentityScansCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityScans _$IdentityScansFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IdentityScans',
      json,
      ($checkedConvert) {
        $checkedConvert('back', (v) => v);
        $checkedConvert('front', (v) => v);
        $checkedConvert('selfie', (v) => v);
        final val = IdentityScans(
          back: $checkedConvert(
              'back',
              (v) => v == null
                  ? null
                  : Resource.fromJson(v as Map<String, dynamic>)),
          front: $checkedConvert(
              'front',
              (v) => v == null
                  ? null
                  : Resource.fromJson(v as Map<String, dynamic>)),
          selfie: $checkedConvert(
              'selfie',
              (v) => v == null
                  ? null
                  : Resource.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$IdentityScansToJson(IdentityScans instance) =>
    <String, dynamic>{
      'back': instance.back?.toJson(),
      'front': instance.front?.toJson(),
      'selfie': instance.selfie?.toJson(),
    };

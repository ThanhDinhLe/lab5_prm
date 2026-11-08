// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_local_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoriteLocalService)
final favoriteLocalServiceProvider = FavoriteLocalServiceProvider._();

final class FavoriteLocalServiceProvider
    extends
        $FunctionalProvider<
          FavoriteLocalService,
          FavoriteLocalService,
          FavoriteLocalService
        >
    with $Provider<FavoriteLocalService> {
  FavoriteLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteLocalServiceHash();

  @$internal
  @override
  $ProviderElement<FavoriteLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FavoriteLocalService create(Ref ref) {
    return favoriteLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoriteLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoriteLocalService>(value),
    );
  }
}

String _$favoriteLocalServiceHash() =>
    r'2c8b4f917fe651a18c9e3688ad3dab7d75d62e07';

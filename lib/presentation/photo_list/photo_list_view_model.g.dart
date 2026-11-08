// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotoListViewModel)
final photoListViewModelProvider = PhotoListViewModelProvider._();

final class PhotoListViewModelProvider
    extends $AsyncNotifierProvider<PhotoListViewModel, List<Photo>> {
  PhotoListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoListViewModelHash();

  @$internal
  @override
  PhotoListViewModel create() => PhotoListViewModel();
}

String _$photoListViewModelHash() =>
    r'd8cadc010b3a731ea9fb6a3d9d74c39708189f7b';

abstract class _$PhotoListViewModel extends $AsyncNotifier<List<Photo>> {
  FutureOr<List<Photo>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Photo>>, List<Photo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Photo>>, List<Photo>>,
              AsyncValue<List<Photo>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

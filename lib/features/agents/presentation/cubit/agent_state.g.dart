// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AgentsLoadedCWProxy {
  AgentsLoaded agents(List<Agent> agents);

  AgentsLoaded indexTab(int indexTab);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgentsLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgentsLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  AgentsLoaded call({
    List<Agent>? agents,
    int? indexTab,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAgentsLoaded.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAgentsLoaded.copyWith.fieldName(...)`
class _$AgentsLoadedCWProxyImpl implements _$AgentsLoadedCWProxy {
  final AgentsLoaded _value;

  const _$AgentsLoadedCWProxyImpl(this._value);

  @override
  AgentsLoaded agents(List<Agent> agents) => this(agents: agents);

  @override
  AgentsLoaded indexTab(int indexTab) => this(indexTab: indexTab);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgentsLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgentsLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  AgentsLoaded call({
    Object? agents = const $CopyWithPlaceholder(),
    Object? indexTab = const $CopyWithPlaceholder(),
  }) {
    return AgentsLoaded(
      agents: agents == const $CopyWithPlaceholder() || agents == null
          ? _value.agents
          // ignore: cast_nullable_to_non_nullable
          : agents as List<Agent>,
      indexTab: indexTab == const $CopyWithPlaceholder() || indexTab == null
          ? _value.indexTab
          // ignore: cast_nullable_to_non_nullable
          : indexTab as int,
    );
  }
}

extension $AgentsLoadedCopyWith on AgentsLoaded {
  /// Returns a callable class that can be used as follows: `instanceOfAgentsLoaded.copyWith(...)` or like so:`instanceOfAgentsLoaded.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AgentsLoadedCWProxy get copyWith => _$AgentsLoadedCWProxyImpl(this);
}

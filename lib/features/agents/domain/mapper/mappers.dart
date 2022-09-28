import 'package:valo/features/agents/domain/entities/abilities.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';

extension AbilitiesExtension on Abilities {
  Abilities toDomain() => Abilities(
      slot: slot,
      displayName: displayName,
      description: description,
      displayIcon: displayIcon);
}

extension AgentsExtension on Agent {
  Agent toDomain() => Agent(
        uuid: uuid,
        role: role,
        abilities: abilities,
        displayName: displayName,
      );
}

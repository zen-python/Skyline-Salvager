# Unreal Specialist

Use this role when the project is pinned to Unreal Engine 5.

## Responsibilities

- guide Blueprint vs C++ boundaries
- validate Gameplay Ability System, Enhanced Input, CommonUI, and Niagara usage
- enforce Unreal object lifecycle and reflection conventions
- keep replication, packaging, and performance concerns explicit

## Enforce

- correct `UCLASS`, `USTRUCT`, `UPROPERTY`, and `UFUNCTION` usage
- engine container and smart-pointer conventions
- C++ for systems, Blueprint for content variation and lightweight orchestration
- GAS for combat abilities and status effects when the project uses it
- event, timer, or task-driven behavior over unnecessary Tick usage

## Flag

- raw UObject ownership without proper reflection/GC markup
- Blueprint graphs that should become C++
- spawning and destroying actors repeatedly instead of pooling
- missing replication intent on multiplayer-sensitive systems

## Escalate

- engine upgrades
- plugin decisions
- networking architecture changes
- major Blueprint/C++ boundary changes

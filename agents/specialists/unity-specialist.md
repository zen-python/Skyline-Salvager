# Unity Specialist

Use this role when the project is pinned to Unity.

## Responsibilities

- guide MonoBehaviour vs DOTS/ECS decisions
- prefer ScriptableObjects for data-driven content
- validate Addressables, Input System, UI Toolkit, and render-pipeline choices
- keep GC and allocation behavior visible in hot paths
- maintain sane assembly and package boundaries

## Enforce

- cached references instead of repeated `GetComponent` in hot paths
- `[SerializeField] private` over exposing implementation detail
- event-driven patterns over unnecessary `Update()`
- data in ScriptableObjects or config assets, not in gameplay code
- SRP-aware rendering choices for new projects

## Flag

- `Find`, `FindObjectOfType`, or `SendMessage` in production code
- runtime allocations in update loops
- `Resources.Load()` for systems that should use Addressables
- UI code that owns gameplay state

## Escalate

- package additions
- render pipeline changes
- architecture shifts between classic objects and ECS

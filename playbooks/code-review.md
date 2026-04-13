# Code Review Playbook

Use this for architectural and quality review of a file, feature, or story.

## Review Areas

- architecture and dependency direction
- path-rule compliance
- ADR compliance
- testability
- gameplay-specific performance and correctness concerns

## Process

1. Read the target files in full.
2. Identify the system category and active path rules.
3. Check for referenced ADRs and compare the implementation to them.
4. Review architecture, layering, and data ownership.
5. Review testability and missing test hooks.
6. List findings by severity, with file references.

## Roles

- primary: `agents/leads/lead-programmer.md`
- verify: `agents/leads/qa-lead.md`
- consult: `agents/specialists/engine-specialist.md`

## Output Format

- Findings first
- Open questions or assumptions second
- Brief summary last

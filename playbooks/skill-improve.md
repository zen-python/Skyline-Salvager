# Skill Improve Playbook

Use this to improve one Codex playbook or plugin skill wrapper using a
test-fix-retest loop.

## Inputs

- target playbook or wrapper
- findings from `playbooks/skill-test.md`

## Process

1. Run the baseline review.
2. Identify the exact structural or behavioral gaps.
3. Make the smallest changes that address those gaps.
4. Re-run the review.
5. Keep or revert based on whether the result improved.

## Recommended Roles

- primary: `agents/leads/lead-programmer.md`
- consult: `agents/leads/qa-lead.md`

# Soak Test Playbook

Use this to create a long-session endurance test protocol.

## Inputs

- duration
- focus area
- game concept and intended session length
- performance budgets
- recent playtest or QA findings

## Process

1. Choose duration and focus.
2. Load performance budgets and prior findings.
3. Define timed observation checkpoints.
4. Specify what to log:
   - memory growth
   - performance drift
   - state accumulation bugs
   - fatigue and content exhaustion
5. Write the protocol in `production/qa/`.

## Recommended Roles

- primary: `agents/leads/qa-lead.md`
- consult: `agents/specialists/qa-tester.md`
- consult: performance-oriented engine specialist when memory or rendering is involved

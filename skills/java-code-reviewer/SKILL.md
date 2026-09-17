---
name: java-code-reviewer
description: Review Java code and Java projects for correctness, maintainability, exception handling, logging, null-safety, resource management, concurrency risks, and obvious code smells. Use when the user asks for Java code review, project review, bug-risk review, maintainability review, or requests checks of Java source files.
---

# Java Code Reviewer

Review Java code conservatively and prioritize concrete, actionable findings.

## Workflow

1. Inspect the relevant Java files before making claims.
2. Prioritize correctness and production risks over style preferences.
3. Check especially for:
   - swallowed or over-broad exceptions;
   - missing validation and null-safety problems;
   - incorrect resource lifecycle handling;
   - unsafe concurrency or shared mutable state;
   - misleading or insufficient logging;
   - duplicated logic and hard-to-maintain control flow;
   - unnecessary complexity.
4. Read `references/style-guide.md` when a consistent review rubric is useful.
5. If shell execution is available, run `scripts/run-checks.sh <project-directory>` before finalizing. Treat script output as supporting evidence, not as the only source of truth.
6. Report findings from highest impact to lowest impact.
7. For each finding, explain:
   - where it occurs;
   - why it matters;
   - a concrete fix.
8. Do not invent bugs when evidence is weak. State uncertainty explicitly.

## Output format

Prefer this structure:

```text
Critical / High
- file:line — issue
  Why: ...
  Fix: ...

Medium / Low
- file:line — issue
  Why: ...
  Fix: ...

Summary
- concise overall assessment
```

If no meaningful problems are found, say so and mention what was checked.

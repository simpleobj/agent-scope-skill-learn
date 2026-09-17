# Java Review Rubric

Use this rubric only as a checklist; do not report an issue unless the code actually supports it.

## Correctness
- Validate external inputs before use.
- Avoid catching `Exception` unless there is a clear boundary reason.
- Preserve exception causes when wrapping exceptions.
- Check for null-sensitive operations and invalid state transitions.

## Resource management
- Prefer try-with-resources for `AutoCloseable` resources.
- Ensure executors, streams, clients, and other owned resources have a clear lifecycle.

## Logging
- Log actionable context, but do not leak secrets or credentials.
- Avoid logging the same exception repeatedly at multiple layers.
- Use appropriate log levels.

## Concurrency
- Watch for shared mutable state.
- Check assumptions around thread safety of collections, clients, caches, and singleton services.
- Avoid blocking calls inside latency-sensitive asynchronous flows unless intentional.

## Maintainability
- Flag duplicated business rules.
- Prefer small cohesive methods over deeply nested control flow.
- Avoid style-only criticism unless it materially affects readability or correctness.

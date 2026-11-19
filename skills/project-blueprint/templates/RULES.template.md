# Project Rules & Engineering Guardrails

**Project Name:** [Project Name]  
**Applies To:** All agents and developers working on this codebase.

---

## 1. Core Engineering Principles
1. **Deep Modules:** Expose small, simple, and intuitive interfaces that conceal complex internal implementations. Avoid shallow pass-through abstractions.
2. **Test at Seams:** Write tests against public module interfaces, never private internal functions. Ensure refactoring internal code does not break test assertions.
3. **Explicit Over Implicit:** Prefer explicit typed contracts, structured errors, and clear function signatures over untyped dynamic parameters or global side-effects.

---

## 2. Guardrails & Prohibited Patterns (Do's and Don'ts)

| Category | ✅ Do | ❌ Don't |
| :--- | :--- | :--- |
| **State** | Keep UI state immutable; mutate state through explicit reducers/events. | Never mutate state objects directly or share mutable references. |
| **Architecture** | Enforce dependency inversion: domain logic never imports UI or framework code. | Don't put business logic, API calls, or DB queries inside UI components. |
| **Styling** | Reference tokens from `DESIGN.md` / theme files (`Color.kt`, `tokens.css`). | Never hardcode raw hex colors (`#FF00FF`), arbitrary padding, or inline fonts. |
| **Errors** | Use typed domain errors (`Result<T, AppError>`) with recovery paths. | Don't use empty `catch` blocks or rethrow generic `Exception` / `Error`. |
| **Dependencies**| Validate new third-party libraries for license, size, and maintenance before adding. | Don't install heavy dependencies for trivial utility functions. |
| **File Size** | Keep files focused and cohesive (typically < 300 lines); extract seams when bloated. | Don't create multi-thousand-line monolithic god-files. |

---

## 3. Coding Style & Conventions
* **Naming Conventions:**
  * Types / Classes / Interfaces: `PascalCase`
  * Functions / Methods / Variables: `camelCase` (or `snake_case` if Python)
  * Constants / Enums: `UPPER_SNAKE_CASE`
  * File Names: Cohesive naming matching the primary export (e.g. `UserProfileCard.kt` or `user-profile.ts`).
* **Code Comments:** Explain *why* a decision was made, not *what* the code does. The code itself should be self-documenting.

---

## 4. Error Handling & Logging
* **Error Classification:** Distinguish between recoverable user errors (validation, offline), transient network failures (retry with jitter), and unrecoverable system crashes.
* **Logging Discipline:** Log structured events with context (timestamp, operation, error category). **Never log user secrets, tokens, or PII.**

---

## 5. Git & Review Standards
* **Conventional Commits:** Enforce conventional commit format:
  * `feat:` new user-facing functionality
  * `fix:` bug resolution
  * `refactor:` code restructuring without behavior changes
  * `test:` adding or updating tests
  * `docs:` documentation updates
* **Diff Minimization:** Every pull request / agent edit should be surgical. Touch only the lines necessary to satisfy the current task.

# Project Memory & Session Handoff Log

**Project Name:** [Project Name]  
**Primary Goal:** [Short reminder of what this project accomplishes]

---

## 1. Architectural Decision Records (ADRs)

| Date | Decision | Rationale | Alternatives Considered & Rejected |
| :--- | :--- | :--- | :--- |
| YYYY-MM-DD | [e.g. Use SQLite over Key-Value store] | [Need relational queries and ACID guarantees] | [Flat JSON file, SharedPreferences] |
| YYYY-MM-DD | [e.g. Isolate BLE parser into separate module] | [Keep hardware protocol logic independent from UI] | [Inline BLE parser in ViewModel] |

---

## 2. Environment & Toolchain Gotchas
*Document platform-specific quirks, local machine dependencies, port collisions, or environment flags:*
* **Gotcha 1:** [e.g., Requires Node >= 20.x due to crypto API usage.]
* **Gotcha 2:** [e.g., Local dev server runs on port 8080; avoid conflicting with local proxy.]
* **Gotcha 3:** [e.g., On Windows, use forward slashes or escaped paths in scripts.]

---

## 3. Debugging Notes & Resolved Roadblocks
*Capture difficult bugs solved so future sessions do not re-investigate:*
* **Issue:** [Description of symptom / error log]
  * **Root Cause:** [What actually caused it]
  * **Fix:** [How it was fixed and which file was modified]

---

## 4. Session History & Handoffs

### Session Log: [YYYY-MM-DD]
* **Accomplished:**
  * [Key task 1 completed]
  * [Key task 2 completed]
* **Discovered / Learned:**
  * [Important insight or edge case found during implementation]
* **Pending / In-Flight:**
  * [State of work left unfinished at end of turn]
* **Next Focus:**
  * [First thing the next agent session should pick up]

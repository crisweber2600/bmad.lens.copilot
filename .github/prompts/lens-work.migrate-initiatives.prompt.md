```prompt
---
description: 'Migrate initiative artifacts from legacy _bmad-output/lens-work/initiatives/ to the governance repo (one-time migration for v2.1 upgrade)'
---

Activate @lens agent and execute `/migrate-initiatives`:

**⚠️ PATH CONTEXT:** All `_bmad/` paths below are relative to the `bmad.lens.release` control repository. Do NOT resolve these paths against the user's main project repo. Only `_bmad-output/` paths are written to the user's working context.

1. Load `@lens` agent: `_bmad/_config/custom/lens-work/lens.agent.yaml`
2. Execute `@lens migrate-initiatives`
3. Load `_bmad/lens-work/workflows/utility/migrate-initiatives/workflow.md`
4. Delegate all git operations to git-orchestration skill

---

**What this migration does:**

Moves initiative artifacts (Domain.yaml, Service.yaml, .gitkeep placeholders) from the legacy control-repo location to the governance repo, where they now belong alongside constitutions, roster, and policies.

| | Old location | New location |
|---|---|---|
| **Initiative files** | `_bmad-output/lens-work/initiatives/` | `{governance_root}/initiatives/` |
| **Repo** | `bmad.lens.release` (control repo) | `bmad.lens.governance` (governance repo) |

**When to run:** Once per control repo instance when upgrading to lens-work v2.1 or later. Safe to re-run — exits cleanly if already migrated.

---

**Execution Sequence:**

**[1] Pre-flight**
```bash
# Verify clean git state (control repo)
git diff-index --quiet HEAD -- || { echo "Uncommitted changes — commit or stash first"; exit 1; }
```

**[2] Resolve Paths**
```yaml
governance_root = module.outputs.governance_repo_root   # from _bmad/_config/custom/lens-work/module.yaml
OLD_INITIATIVES_DIR = "_bmad-output/lens-work/initiatives"
NEW_INITIATIVES_DIR = "${governance_root}/initiatives"
```

**[3] Detect State**
- If `_bmad-output/lens-work/initiatives/` **does not exist**: output `✅ Nothing to migrate.` and stop.
- If governance repo not cloned at `${governance_root}`: output actionable error and stop.

**[4] Show Plan + Confirm**
List all files that will move. Ask user to confirm before proceeding.

**[5] Copy to Governance Repo**
```bash
cp -r "_bmad-output/lens-work/initiatives/." "${governance_root}/initiatives/"
```

**[6] Repair Internal Paths**
For each `Domain.yaml` and `Service.yaml` copied to the new location:
- Find the `folders.initiatives:` field
- Replace any value containing `_bmad-output/lens-work/initiatives` with `${governance_root}/initiatives/{relative_path}/`

**[7] Verify**
Confirm file count in new location ≥ file count in old location. If mismatch, abort without deleting old directory.

**[8] Remove Old Directory**
```bash
rm -rf "_bmad-output/lens-work/initiatives"
```

**[9] Log Migration Event**
Append to `_bmad-output/lens-work/event-log.jsonl`:
```json
{"type":"migrate-initiatives","timestamp":"...","detail":"Moved initiative artifacts from control repo to governance repo","files_migrated":N}
```

**[10] Commit Governance Repo**
```bash
cd "${governance_root}"
git add initiatives/
git commit -m "chore: migrate initiative artifacts from control repo"
```

**[11] Commit Control Repo**
```bash
git add "_bmad-output/lens-work/initiatives" "_bmad-output/lens-work/event-log.jsonl"
git commit -m "chore: remove legacy initiatives dir (moved to governance repo)"
```

**[12] Output Summary**
```
✅ Migration Complete
Files migrated:  N
Old location:    _bmad-output/lens-work/initiatives/  (removed)
New location:    ${governance_root}/initiatives/

Next steps:
  cd ${governance_root} && git push origin HEAD
  git push origin HEAD
  @lens status
```

---

**Rollback (if needed):**
If the migration fails after the copy step but before deletion, both directories exist. Remove the partial copy in the governance repo and the old directory is untouched:
```bash
rm -rf "${governance_root}/initiatives"
```
See `@lens rollback` for full setup rollback.
```

---
agent: agent
model: Claude Sonnet 4.6 (copilot)
---

0. Ensure the path is set to the root of the repository.
1. Clone the repository: https://github.com/crisweber2600/BMAD.Lens.release and change branch to release/4.0.0
2. Clone the repository https://github.com/crisweber2600/bmad.lens.copilot into `.github`:
   - If `.github` already exists, delete it first: `Remove-Item -Recurse -Force .github`
   - Then clone: `git clone https://github.com/crisweber2600/bmad.lens.copilot .github`
3. Clone the governance settings repository and configure it:
   - Read the governance repo coordinates from `_bmad-output/lens-work/governance-setup.yaml`
   - Clone `remote_url` into `local_path` (e.g. `TargetProjects/lens/lens-governance`) and checkout `default_branch`
   - If the repo is already cloned, run `git pull` to ensure it is up to date
4. Trigger the prompt `lens-work.onboard.prompt.md`

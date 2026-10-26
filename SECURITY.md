<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/brand/hero-dark.png">
    <img src="assets/brand/hero-light.png" alt="Orin DX shared actions" width="240">
  </picture>
</p>

<h1 align="center">Security policy</h1>

## Report privately

Please email **security@orin-dx.com** if an action could expose credentials, run attacker-controlled code, or change a release without review. Don't open a public issue before a fix is available. Include the affected action, a concrete failure path, and a safe reproduction if you have one. Please don't send live tokens or private keys.

Expect an acknowledgment within five business days. We'll share progress during triage and credit you when a fix ships unless you'd prefer otherwise.

## What belongs here

These are composite actions: they run in a caller's workflow and inherit that job's permissions and secrets. The main risks are different from a hosted service.

- **Credential boundaries:** a caller's registry token, `GITHUB_TOKEN`, or tap App key reaching a command or repository that should not see it.
- **Untrusted inputs:** a tool name, tag, path, or caller value becoming a shell command, Git ref, or arbitrary `repository_dispatch` destination.
- **Supply chain:** a moving third-party action ref or an unreviewed change to an action that a privileged release job executes.
- **Cross-repository writes:** the Homebrew notifier or App token changing a formula directly, reaching another repository, or bypassing tap PR review.

For a flaw in a tool's own binary or release process, report it to that tool's repository as well. The [tap security policy](https://github.com/orin-dx/homebrew-tap/blob/main/SECURITY.md) covers formula and archive verification.

## Supported revisions

Fixes land on `main`. Callers pin full commit SHAs, so a fix does not reach them until they update that SHA. We do not rewrite old commits to replace code silently.

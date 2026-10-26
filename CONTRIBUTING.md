<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/brand/hero-dark.png">
    <img src="assets/brand/hero-light.png" alt="Orin DX shared actions" width="240">
  </picture>
</p>

<h1 align="center">Contributing</h1>

These actions run inside other repositories' CI jobs. A small change here can affect a build, a release, or a credential boundary elsewhere, so show the caller impact in your PR.

## Make a change

1. Pick the smallest action that owns the behavior. Each directory has its own `action.yml`; keep input names and defaults stable unless callers are ready to migrate.
2. Pin third-party `uses:` steps to reviewed full commit SHAs. Keep `GITHUB_TOKEN` permissions and GitHub App tokens at the smallest scope the job needs.
3. If you change an input or output, show the old and new caller YAML in the PR. For a release notification, check that a caller can send only a tool name and tag, never a formula URL or checksum.

The setup actions have different jobs: `setup-rust` owns Rust targets and caching, `setup-proto-node-pnpm` reads `.prototools`, and `setup-pnpm-cache` only caches pnpm. Keep them composable.

## Check it

```sh
ruby scripts/validate_actions.rb
actionlint .github/workflows/validate.yml
```

The first command parses every composite action and rejects moving `uses:` refs. The second checks this repository's workflow. In a PR, note any caller workflow you inspected and any behavior that needs a real release run to confirm. CI runs the validation command, but it cannot prove a downstream registry or Homebrew update will succeed.

## Send a PR

Keep one behavior change per PR and explain which repositories call the action. For a security-sensitive change, describe the input trust boundary, token permissions, and how you verified the action cannot write outside its intended repository. If you found a vulnerability, follow [private reporting](SECURITY.md) first.

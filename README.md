<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/brand/hero-dark.png">
    <img src="assets/brand/hero-light.png" alt="Orin DX shared actions" width="360">
  </picture>
</p>

<p align="center">
  <b>Small building blocks for the CI jobs we run again and again.</b>
</p>

<p align="center">
  <a href="https://github.com/orin-dx/actions/actions/workflows/validate.yml"><img src="https://github.com/orin-dx/actions/actions/workflows/validate.yml/badge.svg" alt="Shared action checks" /></a>
</p>

---

## Pick an action

| Action | Use it when… | It does… |
| --- | --- | --- |
| [`setup-rust`](setup-rust/action.yml) | A job needs a pinned Rust toolchain or cross target. | Installs Rust components and targets, then caches the build. |
| [`setup-proto-node-pnpm`](setup-proto-node-pnpm/action.yml) | A repo pins Node and pnpm in `.prototools`. | Installs both with proto and optionally caches the pnpm store. |
| [`setup-pnpm-cache`](setup-pnpm-cache/action.yml) | Node and pnpm are already installed. | Caches the pnpm store only. |

Use a **reviewed, full commit SHA** in each caller. A moving tag or branch can change code that runs in a job with release credentials without a change in the calling repo.

## Set up a job

```yaml
steps:
  - uses: orin-dx/actions/setup-rust@<reviewed-full-commit-sha>
    with:
      toolchain: '1.96.0'
      components: 'clippy,rustfmt'
      targets: 'wasm32-wasip1'

  - uses: orin-dx/actions/setup-proto-node-pnpm@<reviewed-full-commit-sha>
    with:
      working-directory: packages/my-node-package
```

`setup-proto-node-pnpm` reads the calling repository's `.prototools`; it does not install Rust. Use `setup-rust` alongside it when the job also needs a specific Rust target.

## Work on these actions

See [Contributing](CONTRIBUTING.md) for validation and caller checks, or [Security](SECURITY.md) to report a credential or workflow issue privately. The `main` branch and current pinned SHAs receive fixes; callers choose when to move to a newer reviewed SHA.

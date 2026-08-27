# actions

Shared, reusable GitHub composite actions for orin-dx/orin-axi repos. Extracted from duplicated CI blocks across michi, lumen, oxc-react-docgen, and callisto.

Pin to a tag (`@v1`), not `@main` -- a floating ref means every consumer changes behavior the moment this repo does, with no chance to review first.

## Actions

- **`setup-rust`** -- `rustup toolchain install` + `Swatinem/rust-cache`. Toolchain channel/version, components, and targets are plain inputs (not the calling action's own git ref, unlike `dtolnay/rust-toolchain`).
- **`setup-proto-node-pnpm`** -- installs node/pnpm from the calling repo's `.prototools` via proto, then caches the pnpm store. Does not touch Rust.
- **`setup-pnpm-cache`** -- just the pnpm store caching step, for when node/pnpm are already installed some other way.

## Usage

```yaml
- uses: orin-dx/actions/setup-rust@v1
  with:
    toolchain: '1.96.0'
    components: 'clippy,rustfmt'
    targets: 'wasm32-wasip1'

- uses: orin-dx/actions/setup-proto-node-pnpm@v1
  with:
    working-directory: packages/my-node-package
```

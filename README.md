# homebrew-tap

Personal Homebrew tap for [@michael-gilbertson](https://github.com/michael-gilbertson)'s tools.

## Install

```sh
brew trust --tap michael-gilbertson/tap
brew install michael-gilbertson/tap/bonsai
```

Homebrew asks you to trust a tap before it loads that tap's formulae, and
bonsai's Process Compose dependency comes from this tap too.

## Formulae

| Formula | Description | Source |
| --- | --- | --- |
| `bonsai` | Run a copy of your app on every branch, with no port collisions | [michael-gilbertson/bonsai](https://github.com/michael-gilbertson/bonsai) |
| `process-compose` | Process Compose, a dependency of bonsai | [F1bonacc1/process-compose](https://github.com/F1bonacc1/process-compose) |

## Updating

```sh
brew upgrade bonsai
```

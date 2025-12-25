# action-scrutinizer

A GitHub action to send Scrutinizer coverage

[![Build docker image](https://github.com/sudo-bot/action-scrutinizer/actions/workflows/build.yml/badge.svg)](https://github.com/sudo-bot/action-scrutinizer/actions/workflows/build.yml)
[![get ocular version](https://github.com/sudo-bot/action-scrutinizer/actions/workflows/ocular.yml/badge.svg)](https://github.com/sudo-bot/action-scrutinizer/actions/workflows/ocular.yml)

You can find the image on [Docker Hub](https://hub.docker.com/r/botsudo/action-scrutinizer)

[![Docker Pulls](https://img.shields.io/docker/pulls/botsudo/action-scrutinizer.svg)](https://hub.docker.com/r/botsudo/action-scrutinizer)

## Example usage

```yml
  - uses: actions/checkout@v6
    with:
        # Fetch 10 commits or Scrutinizer will throw ("Failed to retrieve commit parents. If you use a shallow git checkout, please checkout at least a depth of one."), see: RepositoryIntrospector at scrutinizer-ci/ocular GitHub repository
        # 10 commits is an arbitrary value that is more than 1 commit
        fetch-depth: 10
  - name: Upload Scrutinizer coverage
    uses: sudo-bot/action-scrutinizer@latest
```

## Example advanced usage

```yml
  - uses: actions/checkout@v6
    with:
        # Fetch 10 commits or Scrutinizer will throw ("Failed to retrieve commit parents. If you use a shallow git checkout, please checkout at least a depth of one."), see: RepositoryIntrospector at scrutinizer-ci/ocular GitHub repository
        # 10 commits is an arbitrary value that is more than 1 commit
        fetch-depth: 10
  - name: Upload Scrutinizer coverage
    uses: sudo-bot/action-scrutinizer@latest
    # Do not run this step on forked versions of the main repository (example: contributor forks)
    if: github.repository == 'sudo-bot/example-repo'
    with:
        cli-args: "--format=php-clover build/logs/clover.xml --revision=${{ github.event.pull_request.head.sha || github.sha }}"
```

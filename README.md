# action-scrutinizer

A GitHub action to send Scrutinizer coverage

![Build docker image](https://github.com/sudo-bot/action-scrutinizer/workflows/Build%20docker%20image/badge.svg?branch=main)
![get ocular version](https://github.com/sudo-bot/action-scrutinizer/workflows/get%20ocular%20version/badge.svg?branch=main)

You can find the image on [Docker Hub](https://hub.docker.com/r/botsudo/action-scrutinizer)

[![Docker Pulls](https://img.shields.io/docker/pulls/botsudo/action-scrutinizer.svg)](https://hub.docker.com/r/botsudo/action-scrutinizer)

## Example usage

```yml
  - uses: actions/checkout@v2
  - name: Upload Scrutinizer coverage
    uses: sudo-bot/action-scrutinizer@latest
```

## Example advanced usage

```yml
  - uses: actions/checkout@v2
  - name: Upload Scrutinizer coverage
    uses: sudo-bot/action-scrutinizer@latest
    with:
        cli-args: "--format=php-clover build/logs/clover.xml"
```

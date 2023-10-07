# Entrypoints

These two files are direct copies of the entrypoints in the base [docker-linuxgsm](https://github.com/GameServerManagers/docker-linuxgsm/tree/main) image.

They contain two changes which I haven't yet contributed back to the base project.

## Hooks

This adds the ability to run scripts before/after the install step of the base image. More details in [this PR](https://github.com/GameServerManagers/docker-linuxgsm/pull/36).

## Running a specifc LGSM command

I also added the ability to run a single LGSM command rather then running the whole entrypoint.

This can be used like this:

```yaml
  css:
    image: gameservermanagers/gameserver:csgo/css:latest
    command: auto-install
    volumes:
      - cssmount:/data
```

which can then be mounted into a gmod server. (They changes here cause the command to be ran and then the entrypoint exits)

Haven't yet made a PR to contribute this back... I'll do that at some point... :D

# Falcosidekick-ui

![falcosidekick-ui](https://github.com/falcosecurity/falcosidekick-ui/raw/master/imgs/webui_01.png)

*Disclaimer: This project is a WIP*

## Description

A simple WebUI for displaying latest events from [Falco](https://falco.org). It works as output for [Falcosidekick](https://github.com/falcosecurity/falcosidekick).

## Endpoints

The UI is reachable at `http://localhost:2802/ui`.

## Usage

```shell
  -a string
        Listen Address (default "0.0.0.0")
  -p int
        Listen Port (default 2802)
  -r int
        Number of events to keep in retention (default 50)
```

## Development

### Build

```bash
make falcosidekick-ui
```

### Lint

```bash
make lint
```

Full lint:

```bash
make lint-full
```

## Authors

* Thomas Labarussias (https://github.com/Issif)
* Frank Jogeleit (https://github.com/fjogeleit)


# Traktify TVTime

a docker wrapper for [lukearran/TvTimeToTrakt][link-lukearran-tvtimetotrakt].

## Usage

first of all, you have to follow instructions detailed in [lukearran/TvTimeToTrakt][link-lukearran-tvtimetotrakt].

once you have your *GDPR* data, place the CSV files in `./gdpr-data` directory.

next, you have to create the `./config.json` file (you can use the `./config.json.dist` as a model) and fill it with the trakt's application parameters. More information in the [documentation][link-lukearran-tvtimetotrakt-configuration]

next, you have to create a **blank** file `./localStorage.json` (you can use the `./localStorage.json.dist` as a model).

next, you have to build docker image (there is a *no-cache* option)

```bash
docker compose build --pull

# or 

make build

# or

task docker:build
```

finally you can execute the script

```bash
docker compose run traktifytvtime

# or

make traktifytvtime

# or

task traktifytvtime
```

## Notes

- each time you build the docker image, the [lukearran/TvTimeToTrakt][link-lukearran-tvtimetotrakt] repository will be freshly cloned.

## Credits

- Luke Arran : [github][link-github-lukearran]
- Aymen FNAYOU : [github][link-github]

[link-github]: https://github.com/fnayou
[link-github-lukearran]: https://github.com/lukearran
[link-lukearran-tvtimetotrakt]: https://github.com/lukearran/TvTimeToTrakt
[link-lukearran-tvtimetotrakt-configuration]: https://github.com/lukearran/TvTimeToTrakt#setup-configuration

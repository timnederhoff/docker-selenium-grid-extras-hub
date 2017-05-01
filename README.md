# docker-selenium-grid-extras-hub

Runs a Selenium Grid Hub by [Selenium Grid Extras](https://github.com/groupon/Selenium-Grid-Extras) and the default values.

Set Selenium Grid Extras to version 3.4.0

To run, execute:
```bash
docker run -d -P -p 4444:4444 -p 3000:3000 timnederhoff/selenium-grid-extras-hub
```
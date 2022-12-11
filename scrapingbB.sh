#!/bin/bash

output="output/blueBikes-$(date +"%y-%m-%d-%H-%M-%S").json"
curl -o "${output}" https://data.stad.gent/api/records/1.0/search/?dataset=blue-bike-deelfietsen-gent-sint-pieters-st-denijslaan&q=&facet=name

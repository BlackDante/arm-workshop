#!/bin/bash

az group deployment create --name ExampleDeployment --resource-group "tyg3-rg-we-global-dev" --template-file create.json --parameters @parameters.json
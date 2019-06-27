#!/bin/sh


dotnet tool install -g fake-cli
dotnet tool update -g fake-cli
dotnet tool install -g paket
dotnet tool update -g paket
dotnet tool install -g fabulous-cli
dotnet tool update -g fabulous-cli


dotnet new -i Fabulous.Templates

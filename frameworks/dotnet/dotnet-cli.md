# .NET CLI
## Basic Console Application
```powershell
dotnet --help
dotnet --version
dotnet --info
dotnet --list-sdks
dotnet new --help
dotnet new --list
dotnet new console --output PrimeCalc --force # create new console app
```

PrimeCalc.csproj
```xml

<Project Sdk="Microsoft.NET.Sdk">
        <PropertyGroup>
                <OutputType>Exe</OutputType>
                <TargetFramework>netcoreapp3.1</TargetFramework>
        </PropertyGroup>
</Project>
```

```powershell
dotnet build
dotnet run
dotnet restore # load NuGet dependencies, also executed at build time
dotnet .\bin\Debug\netcoreapp3.1\PrimeCalc.exe
dotnet run --project PrimeCalc.Client
```

## Working with Libraries
```powershell
dotnet new sln --output PrimeCalc
dotnet new console --output PrimeCalc.Client
dotnet new classlib --output PrimeCalc.Math
dotnet sln add .\PrimeCalc.Client\PrimeCalc.Client.csproj .\PrimeCalc.Math\PrimeCalc.Math.csproj
dotnet add PrimeCalc.Client reference PrimeCalc.Math
dotnet add PrimeCalc.Client package Newtonsoft.json
```

## Terminology
- Framework: implementation of .NET Standard
- Runtime: OS + CPU architecture (runtime identifier such as win10-x64, linux-x64, osx.10.10-x64, ...)

# F#

This is an implementation in the [F# language](https://docs.microsoft.com/en-us/dotnet/fsharp/what-is-fsharp).

## Running

To build and run you will need the .NET SDK. Get the latest version [from here](https://dotnet.microsoft.com/download) for your system.

Then you can simply execute the following from within the directory to build and run the project.

``` shell
dotnet run
```

You can also pass in the input number directly as an argument instead of being prompted for it. For example, to run for the value 42:

``` shell
dotnet run 42
```

If you want to compile and publish an optimised executable, use the following command.

``` shell
dotnet publish -c Release
```

You will find the output files in `./bin/Release/net5.0/publish`

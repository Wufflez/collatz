# Zig

This is an implementation in the [Zig language](https://ziglang.org/).

## Building / Running

To build and run you will need Zig installed, which can be [found here](https://ziglang.org/download/)

To build and immediately run the program you can simply execute the following:

``` shell
zig run ./collatz.zig
```

*(or to pass an input number as an argument)*:

``` shell
zig run ./collatz.zig -- <number>
```

If you would like to build and produce an executable with optimisations, you can do so with the following:

``` shell
zig build-exe -O ReleaseSafe ./collatz.zig
```

See more about options for building zig programs [here](https://ziglearn.org/chapter-3/) if you are interested.

# Toy Robot

## Usage

Toy Robot can be run interactively or non-interactively by supplying
one or more command files as arguments.  Sample command files can
be found in ./test/data

```
$ ./toy-robot.rb <commandfile1> <commandfile2>
```
Or, to enter commands on STDIN. Ctrl+C exits the program in interactive mode.
```
$ ./toy-robot.rb
```

Invalid or malformed commands are ignored by the Toy Robot.

## Unit Testing

From the project root run the following.

```
$ bundle exec rake
```

## Regression Testing

From the project root run the following, note that md5 must be
installed on your system to run regression tests.

```
$ ./regression-test
```

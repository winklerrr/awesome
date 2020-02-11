# Awesome Bash Cheatsheet

**Using the Shebang**

The first line of a script file which tells the computer how the script should be run is the so called "shebang" line:

```
#!/bin/bash
```

This allows the script to be executed in the following manner:

```
./script.sh
```

(The script needs to be marked as executable. Otherwise just call the interpreter directly: `bash script.sh`)

## Functions

A bash function can be defined with the keyword `function` before the function name or with parentheses after the function name:

```
function function_name {
  COMMADS
}

# or

function_name () {
  COMMANDS
}
```


## Function Arguments

- `$1`, `$2`, ..., `$n`: The passed arguments corresponding to the position of the argument after the functions name.
- `$0`: The function's name.
- `$#`: The number of arguments passed to the function.
- `$@`: All passed arguments. When double quoted `"$@"` expands to separate strings: `"$1" "$2" ... "$n"`.
- `$*`: All passed arguments. When double quoted `"$*"` expands to a single string: `"$1 $2 ... $n"`.
- `$?`: The exit status of the most recently run process.


## Condionals
(Source: [tldp.org](https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-6.html))

The basic conditional:

```
#!/bin/bash

var1="foo"

if [ "$var1" = "foo" ]; then
  echo "var1 == 'foo'"
else
  echo "var1 != 'foo'"
fi
```


# Awesome Bash Cheatsheet

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

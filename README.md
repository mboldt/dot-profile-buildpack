# .profile Buildpack

A [utility buildpack](https://github.com/buildpacks/rfcs/blob/main/text/0097-official-utility-buildpacks.md) to support the [`.profile` script](https://github.com/buildpacks/rfcs/blob/main/text/0093-remove-shell-processes.md#appprofile) functionality when the buildpacks spec [removes shell processes](https://github.com/buildpacks/rfcs/blob/main/text/0093-remove-shell-processes.md).

The buildpack will detect a `.profile` or `.profile.bat` file in the application directory.
If that file exists, it will source it and export any environment variables it sets.

## How it works

This buildpack will wrap the `.profile` script with the `exec.d` interface.
It will use a shell to source the `.profile` script, and write the environment variables to the `exec.d` output file.
This effectively captures most of the behavior of the `.profile` script.

## Limitations

Since the app image's processes will not run in the same shell as the wrapped `.profile` script, things like bash function definitions will not be supported.

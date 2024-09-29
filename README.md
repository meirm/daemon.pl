# Perl Daemonizer Utility

This simple Perl script allows you to daemonize any script or command, running it in the background as a daemon process. It supports retaining the original working directory before executing the command, ensuring that the daemon starts from the correct location.

## Features

- Daemonizes any script or command provided as an argument
- Caches the original working directory (PWD) and changes back to it before executing the command
- Redirects `STDIN`, `STDOUT`, and `STDERR` to `/dev/null` to run as a proper daemon

## Prerequisites

- Perl 5.x or later
- `POSIX` and `Cwd` Perl modules (usually included in the default Perl installation)

## Installation

No installation is necessary. Simply download or copy the script to your desired location and make it executable:

```bash
chmod +x daemonize.pl
```

## Usage

The utility can be run with any script or command as follows:

```bash
./daemonize.pl <command> [arguments]
```

### Example

To run a script named `my_script.sh` in the background:

```bash
./daemonize.pl /path/to/my_script.sh arg1 arg2
```

This will daemonize `my_script.sh`, printing the process ID (PID) to the terminal and then exiting.

### Another Example

To run a Python script named `example.py` with arguments:

```bash
./daemonize.pl python3 /path/to/example.py --option value
```

## How It Works

1. The script forks a child process and exits the parent process, ensuring that it runs in the background.
2. It creates a new session using `setsid` to detach from the terminal.
3. `STDIN`, `STDOUT`, and `STDERR` are redirected to `/dev/null` for proper daemon operation.
4. The script caches the original PWD before changing to `/` and restores it just before executing the provided command.

## Notes

- Ensure you have the necessary permissions to execute the script you want to daemonize.
- Since `STDOUT` and `STDERR` are redirected to `/dev/null`, any output from the executed command will not be visible.

## Troubleshooting

- If the script fails to execute, make sure that the provided command and its path are correct.
- Check for any Perl module dependencies (`POSIX` and `Cwd`) if you encounter issues.

## License

This utility is open-source and available under the MIT License. Feel free to modify and distribute it as needed.

## Author

- Developed by [Your Name]

Feel free to contribute or suggest improvements!

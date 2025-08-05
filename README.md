# mac-locked

A simple command-line tool to check if the macOS screen is locked.

## Description

`mac-locked` is a Swift-based utility that determines whether the macOS screen is currently locked. It's particularly useful for automation scripts that need to behave differently based on whether you're working directly on the Mac or connected via SSH.

## Usage

```bash
mac-locked [options]
```

### Options

- `-q, --quiet`: Suppress output. Only the exit code indicates the lock status.

### Exit Codes

- `0`: Screen is locked
- `1`: Screen is unlocked

## Examples

### Basic Usage

```bash
# Check lock status with output
mac-locked
# Output: "Locked" or "Unlocked"

# Check lock status silently
mac-locked -q
# No output, only exit code
```

### Use Case: AWS SSO Login

This tool is particularly useful for AWS SSO login automation, where you want different behavior based on whether you're working locally or remotely:

```bash
if mac-locked -q; then
  # Screen is locked - use headless mode for SSH/remote sessions
  aws sso login --profile your-profile --headless
else
  # Screen is unlocked - use interactive mode for local sessions
  aws sso login --profile your-profile
fi
```

## Building

To build the tool:

```bash
task build
```

## Requirements

- macOS
- Swift compiler

## How It Works

The tool uses the `CGSessionCopyCurrentDictionary()` API to access the current session information and checks the `CGSSessionScreenIsLocked` key to determine the lock status. 

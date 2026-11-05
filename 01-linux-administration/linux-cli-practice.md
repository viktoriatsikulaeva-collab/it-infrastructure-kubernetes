
# Linux Command Line Practice

## Objective

Practice basic Linux commands for navigating directories, creating files, working with text, and managing the filesystem.

## Environment

- Ubuntu 26.04 LTS
- WSL2 on Windows 11
- Terminal: Bash

## Learning Resource

[Ubuntu - The Linux Command Line for Beginners](https://ubuntu.com/desktop/docs/en/latest/tutorial/the-linux-command-line-for-beginners/)

## Practical Tasks

### 1. Creating directories

Command:
`mkdir -p dir4/dir5/dir6`

Created nested directories using the `-p` option.

### 2. Creating text files

Commands:
`echo "This is a test" > test_1.txt`

`echo "This is a second test" > test_2.txt`

Created two text files using output redirection.

### 3. Reading files

Command:
`cat test_1.txt test_2.txt`

Displayed the contents of both files.

### 4. Using wildcards

Command:
`cat test_?.txt`

Used `?` to match a single character in filenames.

### 5. Combining files

Command:
`cat t* > combined.txt`

Combined the contents of matching text files into one file.

### 6. Moving files

Command:
`mv combined.txt dir1`

Moved the combined file into another directory.

### 7. Counting lines

Command:
`wc -l dir1/combined.txt`

Verified the number of lines in the combined file.

## Troubleshooting

- `cat tutorial` failed because the file did not exist.
- `cat /tmp/tutorial` failed because the specified path was a directory.
- After moving `combined.txt`, its new path had to be used.

## What I Learned

- Linux directory navigation and file management
- Creating nested directories
- Standard output and file redirection
- Filename wildcards
- Combining files
- Moving files between directories
- Using relative paths
- Understanding basic terminal errors

## Evidence

Screenshot: `../evidence/screenshots/08-linux-command-line-tutorial.png`

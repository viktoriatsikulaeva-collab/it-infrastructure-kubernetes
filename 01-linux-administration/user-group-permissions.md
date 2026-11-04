# Linux User and Group Permissions — Hands-on Lab

## Objective

Practice Linux user and group management, file ownership, and access control using the principle of least privilege.

## Environment

- Ubuntu on WSL2
- Bash terminal
- Linux user and group administration

## Tasks Completed

1. Created a test user named `testuser`.
2. Created a Linux group named `itteam`.
3. Added `testuser` to the group using `usermod -aG`.
4. Created a test directory and file.
5. Configured directory permissions to `750`.
6. Configured file permissions to `640`.
7. Tested file access using different user accounts.

## Commands Practiced

- `adduser` — create a user
- `groupadd` — create a group
- `usermod -aG` — assign supplementary groups
- `id` and `groups` — inspect user identity and group membership
- `chgrp` — change group ownership
- `chmod` — configure access permissions
- `sudo -u` — execute commands as another user

## Access Control Results

| User | Access | Result |
|---|---|---|
| viktoriatsi | Owner | Read and write permitted |
| testuser | Member of itteam | Read permitted |
| nobody | Outside permitted group | Permission denied |

Directory permissions: `750` (`rwxr-x---`)

File permissions: `640` (`rw-r-----`)

### Verification

Command:

`sudo -u testuser cat /tmp/linux-access-lab-viktoriatsi/message.txt`

Result:

`Hello from Linux Administrator`

Command:

`sudo -u nobody cat /tmp/linux-access-lab-viktoriatsi/message.txt`

Result:

`Permission denied`

## Key Learnings

- Linux access permissions distinguish owners, groups, and other users.
- Access to files also depends on permissions of parent directories.
- Group membership allows controlled access without granting administrator privileges.
- The principle of least privilege helps protect shared Linux resources.

## Outcome

Successfully configured and tested user-based and group-based file access in Ubuntu.

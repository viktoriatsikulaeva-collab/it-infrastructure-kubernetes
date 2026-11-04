# Linux File Permissions and Backup Lab

## Objective
Practice Linux file permissions and configuration backups.

## Tasks
1. Inspect the current user and group using `id`.
2. Create a temporary configuration file.
3. Apply `chmod 600` to allow owner read/write access.
4. Apply `chmod 000` to simulate a permission problem.
5. Restore access using `chmod 600`.
6. Create a backup with `tar`.
7. Restore the backup and compare files using `cmp`.

## Evidence
[View test results](../evidence/foundation-lab-results.txt)

## Security
The exercise uses temporary files only.

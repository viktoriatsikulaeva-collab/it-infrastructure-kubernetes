# Troubleshooting: File Permission Error

## Problem
A sample configuration file becomes unreadable after its
permissions are changed to 000.

## Diagnosis
Use `stat` to inspect permissions and `test -r` to check access.

## Solution
Restore access using `chmod 600`.

## Verification
[View lab results](../evidence/foundation-lab-results.txt)

This is a controlled simulation using temporary files.

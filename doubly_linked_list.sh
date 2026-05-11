#!/usr/bin/env bash

# Safer Bash mode:
# -e: exit on command errors
# -u: treat unset variables as errors
# -o pipefail: fail a pipeline if any command fails
set -euo pipefail

# We model each node by index, and keep node fields in parallel arrays.
# For any node index i:
#   values[i]   = node data (the user-entered value)
#   prev_idx[i] = index of previous node, or -1 if none
#   next_idx[i] = index of next node, or -1 if none
declare -a values=()
declare -a prev_idx=()
declare -a next_idx=()

# head points to the first node index, tail points to the last.
# A value of -1 means the list is empty or has no neighbor in that direction.
head=-1
tail=-1

# append_node VALUE
# Adds a new node to the end of the doubly-linked list.
append_node() {
    local value="$1"
    # The new node's index is the next free slot in the arrays.
    local idx="${#values[@]}"

    # Store node data and link it to the current tail.
    values[idx]="$value"
    prev_idx[idx]="$tail"
    # New tail has no next node yet.
    next_idx[idx]=-1

    # If a tail already exists, link old tail -> new node.
    # Otherwise, this is the first node, so it becomes head too.
    if [[ $tail -ne -1 ]]; then
        next_idx[tail]="$idx"
    else
        head="$idx"
    fi

    # Move tail pointer to the newly appended node.
    tail="$idx"
}

# print_forward
# Traverses from head to tail following next_idx and prints values.
print_forward() {
    local current="$head"
    # 'first' helps avoid printing the delimiter before the first value.
    local first=1

    printf 'Forward: '
    # Continue until we hit the sentinel index -1.
    while [[ $current -ne -1 ]]; do
        if [[ $first -eq 0 ]]; then
            printf ' -> '
        fi
        printf '%s' "${values[current]}"
        first=0
        current="${next_idx[current]}"
    done
    printf '\n'
}

# print_backward
# Traverses from tail to head following prev_idx and prints values.
print_backward() {
    local current="$tail"
    local first=1

    printf 'Backward: '
    while [[ $current -ne -1 ]]; do
        if [[ $first -eq 0 ]]; then
            printf ' -> '
        fi
        printf '%s' "${values[current]}"
        first=0
        current="${prev_idx[current]}"
    done
    printf '\n'
}

# Prompt the user for values until they choose to quit.
echo "Enter values for the doubly-linked list."
echo "Type Q to quit and print the list."

while true; do
    # -r keeps backslashes literal in user input.
    read -r -p "Value: " input

    # Quit on Q/q and move to printing the list.
    if [[ "$input" == "Q" || "$input" == "q" ]]; then
        break
    fi

    # Any non-quit input becomes a new node appended to the list.
    append_node "$input"
done

# If user quit without entering values, report empty list and finish.
if [[ $head -eq -1 ]]; then
    echo "The list is empty."
    exit 0
fi

# Show list content in both directions to demonstrate doubly-linking.
print_forward
print_backward
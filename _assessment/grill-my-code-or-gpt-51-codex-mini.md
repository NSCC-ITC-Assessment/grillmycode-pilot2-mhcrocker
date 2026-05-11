## Grill My Code

> **Generated:** 2026-05-11 16:29:56 UTC
> **Commits reviewed:** `1de625a` → `e2088d7`

> **Files assessed:** `doubly_linked_list.sh`

---

**`doubly_linked_list.sh`**

```sh
set -euo pipefail
```

1. What effect does `set -euo pipefail` have on the script's execution environment in doubly_linked_list.sh?

---

**`doubly_linked_list.sh`**

```sh
declare -a values=()
declare -a prev_idx=()
declare -a next_idx=()
```

2. Why are the arrays `values`, `prev_idx`, and `next_idx` initialized with `=()` before any nodes are appended?

---

**`doubly_linked_list.sh`**

```sh
head=-1
tail=-1
```

3. What is the significance of initializing both `head` and `tail` to `-1`, and how does that sentinel value influence later conditional checks?

---

**`doubly_linked_list.sh`**

```sh
append_node() {
    local value="$1"

    local idx="${#values[@]}"
```

4. How is the new node index calculated using `idx="${#values[@]}"` and why is this appropriate for appending nodes?

---

**`doubly_linked_list.sh`**

```sh
    values[idx]="$value"
    prev_idx[idx]="$tail"

    next_idx[idx]=-1
```

5. In `append_node`, how do the assignments to `values[idx]`, `prev_idx[idx]`, and `next_idx[idx]` establish the new node's relationships within the doubly-linked list?

---

**`doubly_linked_list.sh`**

```sh
    if [[ $tail -ne -1 ]]; then
        next_idx[tail]="$idx"
    else
        head="$idx"
    fi

    tail="$idx"
}
```

6. Explain how the `if` block inside `append_node` updates both `head` and the previous node’s `next_idx` to integrate the new node, and under which condition the new node becomes the list's head.

---

**`doubly_linked_list.sh`**

```sh
print_forward() {
    local current="$head"

    local first=1
```

7. In `print_forward`, what is the role of the local flag variable `first`, and how does it affect the printed output when traversing from `head`?

---

**`doubly_linked_list.sh`**

```sh
    while [[ $current -ne -1 ]]; do
        if [[ $first -eq 0 ]]; then
            printf ' -> '
        fi
        printf '%s' "${values[current]}"
        first=0
        current="${next_idx[current]}"
    done
```

8. Describe how the `while` loop in `print_forward` uses `next_idx` to traverse the list, and why it checks for `current -ne -1`.

---

**`doubly_linked_list.sh`**

```sh
print_backward() {
    local current="$tail"
    local first=1
```

9. Why does `print_backward` start with `current="$tail"` and how does it contrast with `print_forward`?

---

**`doubly_linked_list.sh`**

```sh
    while [[ $current -ne -1 ]]; do
        if [[ $first -eq 0 ]]; then
            printf ' -> '
        fi
        printf '%s' "${values[current]}"
        first=0
        current="${prev_idx[current]}"
    done
```

10. In `print_backward`, how is `prev_idx` leveraged to print the list in reverse order, and what would happen if `prev_idx[current]` were unset?

---

**`doubly_linked_list.sh`**

```sh
echo "Enter values for the doubly-linked list."
echo "Type Q to quit and print the list."
```

11. What user interaction flow do these two `echo` statements initiate before the input loop starts?

---

**`doubly_linked_list.sh`**

```sh
while true; do

    read -r -p "Value: " input

    if [[ "$input" == "Q" || "$input" == "q" ]]; then
        break
    fi

    append_node "$input"
done
```

12. How does the `while true` loop handle user input and determine when to stop adding nodes via `append_node`?

---

**`doubly_linked_list.sh`**

```sh
    if [[ "$input" == "Q" || "$input" == "q" ]]; then
        break
    fi
```

13. Why does the script compare the user input against both uppercase and lowercase `Q` before breaking, and what would change if only uppercase were checked?

---

**`doubly_linked_list.sh`**

```sh
    append_node "$input"
```

14. Describe how the `append_node` function is used here and why the user input is quoted when passed as an argument.

---

**`doubly_linked_list.sh`**

```sh
if [[ $head -eq -1 ]]; then
    echo "The list is empty."
    exit 0
fi
```

15. What condition does this `if` statement check to determine if the list has no elements, and why is `exit 0` appropriate in that case?

---

**`doubly_linked_list.sh`**

```sh
print_forward
print_backward
```

16. Once the list contains nodes, what does calling `print_forward` followed by `print_backward` accomplish in terms of output?

---

**`doubly_linked_list.sh`**

```sh
    next_idx[idx]=-1
```

17. Why does the code explicitly set `next_idx[idx]` to `-1` when a node is appended, and how does that sentinel value signal the end of the list?

---

**`doubly_linked_list.sh`**

```sh
        if [[ $first -eq 0 ]]; then
            printf ' -> '
        fi
        printf '%s' "${values[current]}"
        first=0
```

18. Explain how toggling `first` from `1` to `0` controls whether the arrow separator is printed before each node in both print functions.

---

**`doubly_linked_list.sh`**

```sh
current="${next_idx[current]}"
```

19. What would happen if this line in `print_forward` were accidentally omitted, and why is it essential for the loop to progress?

---

**`doubly_linked_list.sh`**

```sh
current="${prev_idx[current]}"
```

20. In `print_backward`, how does updating `current` with `prev_idx[current]` ensure the loop terminates correctly when reaching the list’s start?

---

---

<sub>Generated by [grill-my-code](https://github.com/NSCC-ITC-Assessment/GrillMyCode) · openai/gpt-5.1-codex-mini via openrouter · main</sub>
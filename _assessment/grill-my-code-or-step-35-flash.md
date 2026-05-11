## Grill My Code

> **Generated:** 2026-05-11 16:39:11 UTC
> **Commits reviewed:** `1de625a` → `8430ee7`

> **Files assessed:** `doubly_linked_list.sh`

---

**`doubly_linked_list.sh`**

```sh
set -euo pipefail

declare -a values=()
declare -a prev_idx=()
declare -a next_idx=()

head=-1
tail=-1
```

1. What is the purpose of the `set -euo pipefail` directive at the beginning of `doubly_linked_list.sh`?
2. Why are `head` and `tail` initialized to `-1` instead of `0`?
3. What do the three arrays `values`, `prev_idx`, and `next_idx` collectively represent in this implementation?
4. How does this shell script simulate a doubly linked list using only arrays?

---

**`doubly_linked_list.sh`**

```sh
append_node() {
    local value="$1"

    local idx="${#values[@]}"

    values[idx]="$value"
    prev_idx[idx]="$tail"

    next_idx[idx]=-1

    if [[ $tail -ne -1 ]]; then
        next_idx[tail]="$idx"
    else
        head="$idx"
    fi

    tail="$idx"
}
```

5. In `append_node`, what does the expression `local idx="${#values[@]}"` compute and why?
6. Why does `append_node` assign `prev_idx[idx]="$tail"` before potentially updating `tail`?
7. What is the significance of setting `next_idx[idx]=-1` for the new node?
8. Under what condition does the `if [[ $tail -ne -1 ]]` branch execute, and what does it do?
9. What happens to the `head` variable when the very first node is appended?
10. After `append_node` finishes, what does the `tail` variable point to?
11. How does `append_node` maintain the doubly-linked property when adding a node to an empty list?
12. If the list already has nodes, how does `append_node` update the previous tail's `next_idx`?
13. What would be the value of `prev_idx[0]` after appending the first node?
14. What would be the value of `next_idx[0]` after appending the first node?
15. What would be the value of `prev_idx[1]` after appending a second node?

---

**`doubly_linked_list.sh`**

```sh
print_forward() {
    local current="$head"

    local first=1

    printf 'Forward: '

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
```

16. What is the purpose of the `first` variable in `print_forward`?
17. How does `print_forward` traverse the list from beginning to end?
18. What condition terminates the `while` loop in `print_forward`?
19. Why does `print_forward` use `current="${next_idx[current]}"` to move to the next node?
20. What will `print_forward` output for a list with a single node?
21. What will `print_forward` output for a list with three nodes having values `A`, `B`, `C`?
22. If `head` is `-1`, what does `print_forward` output?

---

**`doubly_linked_list.sh`**

```sh
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
```

23. How does `print_backward` differ from `print_forward` in terms of traversal direction?
24. What array does `print_backward` use to move to the previous node?
25. What condition terminates the `while` loop in `print_backward`?
26. What will `print_backward` output for a list with a single node?
27. What will `print_backward` output for a list with three nodes having values `A`, `B`, `C`?
28. If `tail` is `-1`, what does `print_backward` output?

---

**`doubly_linked_list.sh`**

```sh
echo "Enter values for the doubly-linked list."
echo "Type Q to quit and print the list."

while true; do

    read -r -p "Value: " input

    if [[ "$input" == "Q" || "$input" == "q" ]]; then
        break
    fi

    append_node "$input"
done
```

29. What is the purpose of the `while true` loop in the main body?
30. What does the `read -r -p "Value: " input` command do?
31. Under what condition does the loop terminate?
32. What happens to the user's input (unless it is `Q` or `q`)?
33. Why does the script check both uppercase `Q` and lowercase `q`?
34. If the user enters an empty line (just presses Enter), what happens?
35. How many nodes will be created if the user enters: `X`, `Y`, `Z`, `Q`?

---

**`doubly_linked_list.sh`**

```sh
if [[ $head -eq -1 ]]; then
    echo "The list is empty."
    exit 0
fi

print_forward
print_backward
```

36. Why does the script check `if [[ $head -eq -1 ]]` to determine if the list is empty?
37. What does `exit 0` do in this context?
38. If the list is not empty, what two functions are called and in what order?
39. What is the overall output format when the list has elements?
40. If the user enters `Q` immediately without any values, what is the final output?

---

**`doubly_linked_list.sh`**

41. How does the `prev_idx` array for the first node in the list differ from all other nodes' `prev_idx` entries?
42. How does the `next_idx` array for the last node in the list differ from all other nodes' `next_idx` entries?
43. What is the relationship between the indices stored in `next_idx[i]` and `prev_idx[j]` for two adjacent nodes?
44. If you wanted to insert a new node at the beginning (prepend) instead of the end, which variables would need to be updated?
45. How could you modify the script to also support deleting the last node?
46. What would be the effect of changing `tail="$idx"` to `head="$idx"` in `append_node`?
47. Why does `print_forward` and `print_backward` both use a `first` flag instead of checking if `current == head` or `current == tail`?
48. If the user enters a value containing spaces (e.g., `hello world`), how does `append_node` handle it?
49. What does the `local` keyword do in the function definitions, and why is it used?
50. If the script were to be extended to support integer values and compute their sum, where would be the most appropriate place to add that logic?

---

<sub>Generated by [grill-my-code](https://github.com/NSCC-ITC-Assessment/GrillMyCode) · stepfun/step-3.5-flash via openrouter · main</sub>
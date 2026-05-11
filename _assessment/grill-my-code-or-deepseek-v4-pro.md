## Grill My Code

> **Generated:** 2026-05-11 16:19:23 UTC
> **Commits reviewed:** `1de625a` → `039d8eb`

> **Files assessed:** `doubly_linked_list.sh`

---

**`doubly_linked_list.sh`**
```sh
set -euo pipefail
```

1. What does `set -euo pipefail` enforce in the script?

---

**`doubly_linked_list.sh`**
```sh
declare -a values=()
```

2. What is the purpose of initializing `values` as an empty array?

---

**`doubly_linked_list.sh`**
```sh
declare -a prev_idx=()
```

3. What will be stored in the `prev_idx` array during execution?

---

**`doubly_linked_list.sh`**
```sh
declare -a next_idx=()
```

4. What role does the `next_idx` array play in representing the linked list?

---

**`doubly_linked_list.sh`**
```sh
head=-1
```

5. What does the initial value of `head=-1` signify about the list?

---

**`doubly_linked_list.sh`**
```sh
tail=-1
```

6. What does `tail=-1` indicate before any node is appended?

---

**`doubly_linked_list.sh`**
```sh
append_node() {
    local value="$1"
```

7. What does `local value="$1"` do inside the `append_node` function?

---

**`doubly_linked_list.sh`**
```sh
    local idx="${#values[@]}"
```

8. What does `local idx="${#values[@]}"` compute, and why is that value used as the index for the new node?

---

**`doubly_linked_list.sh`**
```sh
    values[idx]="$value"
```

9. What does `values[idx]="$value"` accomplish in `append_node`?

---

**`doubly_linked_list.sh`**
```sh
    prev_idx[idx]="$tail"
```

10. Why is the new node’s `prev_idx` set to the current value of `tail`?

---

**`doubly_linked_list.sh`**
```sh
    next_idx[idx]=-1
```

11. Why is `next_idx[idx]` set to `-1` immediately after creating the new node?

---

**`doubly_linked_list.sh`**
```sh
    if [[ $tail -ne -1 ]]; then
        next_idx[tail]="$idx"
    else
        head="$idx"
    fi
```

12. What condition is being tested by `if [[ $tail -ne -1 ]]` in `append_node`?

---

**`doubly_linked_list.sh`**
```sh
        next_idx[tail]="$idx"
```

13. What does `next_idx[tail]="$idx"` achieve when the list is not empty?

---

**`doubly_linked_list.sh`**
```sh
        head="$idx"
```

14. Under what circumstances does `head="$idx"` execute, and what is its effect?

---

**`doubly_linked_list.sh`**
```sh
    tail="$idx"
```

15. After the `if` block, `tail="$idx"` always runs. What does this line update?

---

**`doubly_linked_list.sh`**
```sh
print_forward() {
    local current="$head"
```

16. Why is `current` initialized to `head` at the start of `print_forward`?

---

**`doubly_linked_list.sh`**
```sh
    local first=1
```

17. What is the role of the `first` variable in `print_forward`?

---

**`doubly_linked_list.sh`**
```sh
    printf 'Forward: '
```

18. What does the `printf 'Forward: '` line output before the traversal begins?

---

**`doubly_linked_list.sh`**
```sh
    while [[ $current -ne -1 ]]; do
```

19. What condition causes the `while` loop in `print_forward` to stop iterating?

---

**`doubly_linked_list.sh`**
```sh
        if [[ $first -eq 0 ]]; then
            printf ' -> '
        fi
```

20. How does the `if [[ $first -eq 0 ]]` block control the arrow separator between values?

---

**`doubly_linked_list.sh`**
```sh
        first=0
```

21. What is the effect of setting `first=0` inside the `print_forward` loop?

---

**`doubly_linked_list.sh`**
```sh
        printf '%s' "${values[current]}"
```

22. What does `printf '%s' "${values[current]}"` output, and why is `%s` used?

---

**`doubly_linked_list.sh`**
```sh
        current="${next_idx[current]}"
```

23. How does `current="${next_idx[current]}"` advance the traversal in `print_forward`?

---

**`doubly_linked_list.sh`**
```sh
    printf '\n'
```

24. What does the final `printf '\n'` do in `print_forward`?

---

**`doubly_linked_list.sh`**
```sh
print_backward() {
    local current="$tail"
```

25. Why does `print_backward` start with `current="$tail"` instead of `head`?

---

**`doubly_linked_list.sh`**
```sh
        current="${prev_idx[current]}"
```

26. How does `current="${prev_idx[current]}"` enable backward traversal in `print_backward`?

---

**`doubly_linked_list.sh`**
```sh
echo "Enter values for the doubly-linked list."
echo "Type Q to quit and print the list."
```

27. What information do the two `echo` statements provide to the user before the input loop?

---

**`doubly_linked_list.sh`**
```sh
while true; do
```

28. What is the purpose of the `while true` loop in the main script?

---

**`doubly_linked_list.sh`**
```sh
    read -r -p "Value: " input
```

29. What does the `-r` option in `read -r` prevent, and how does the `-p` option affect the prompt?

---

**`doubly_linked_list.sh`**
```sh
    if [[ "$input" == "Q" || "$input" == "q" ]]; then
        break
    fi
```

30. What happens when the user enters `Q` or `q` inside the input loop?

---

**`doubly_linked_list.sh`**
```sh
    append_node "$input"
```

31. If the user presses Enter without typing anything, what value is passed to `append_node`, and what node is created?

---

**`doubly_linked_list.sh`**
```sh
if [[ $head -eq -1 ]]; then
    echo "The list is empty."
    exit 0
fi
```

32. What condition does `if [[ $head -eq -1 ]]` check after the input loop ends?

---

**`doubly_linked_list.sh`**
```sh
    exit 0
```

33. What does `exit 0` do when the list is empty, and why is it placed there?

---

**`doubly_linked_list.sh`**
```sh
print_forward
print_backward
```

34. Why are both `print_forward` and `print_backward` called after the input loop?

---

**`doubly_linked_list.sh`**
```sh
    local idx="${#values[@]}"
```

35. How does using `${#values[@]}` as the new node’s index guarantee a unique position without maintaining a separate counter?

---

**`doubly_linked_list.sh`**
```sh
head=-1
tail=-1
```

36. Why is `-1` chosen as the sentinel value for `head` and `tail` instead of, for example, `0`?

---

**`doubly_linked_list.sh`**
```sh
    prev_idx[idx]="$tail"
```

37. What would be the value of `prev_idx` for the very first node appended to an empty list?

---

**`doubly_linked_list.sh`**
```sh
    next_idx[idx]=-1
```

38. Why is it important that every new node’s `next_idx` is initialized to `-1`?

---

**`doubly_linked_list.sh`**
```sh
        head="$idx"
```

39. When the list is empty and the first node is added, what values do `head` and `tail` hold immediately after `append_node` finishes?

---

**`doubly_linked_list.sh`**
```sh
        next_idx[tail]="$idx"
```

40. After appending a second node, how does `next_idx` of the original tail change?

---

**`doubly_linked_list.sh`**
```sh
    while [[ $current -ne -1 ]]; do
```

41. In both `print_forward` and `print_backward`, what does the condition `$current -ne -1` ensure?

---

**`doubly_linked_list.sh`**
```sh
        printf '%s' "${values[current]}"
```

42. If a node’s value contains spaces, how does `printf '%s' "${values[current]}"` handle the output compared to `echo`?

---

**`doubly_linked_list.sh`**
```sh
    read -r -p "Value: " input
```

43. If the user types a value with leading/trailing spaces, how does the default `read` behavior affect the value stored in `input`?

---

**`doubly_linked_list.sh`**
```sh
    if [[ "$input" == "Q" || "$input" == "q" ]]; then
```

44. Why does the script check for both uppercase `Q` and lowercase `q`?

---

**`doubly_linked_list.sh`**
```sh
    append_node "$input"
```

45. What happens if the user enters a value that contains the string `Q` (e.g., `Quit`) – will it be treated as a quit command or a node value?

---

**`doubly_linked_list.sh`**
```sh
print_forward
```

46. What would the output of `print_forward` look like if the list contains the single value `"A"`?

---

**`doubly_linked_list.sh`**
```sh
print_backward
```

47. For the same single‑node list containing `"A"`, what does `print_backward` output?

---

**`doubly_linked_list.sh`**
```sh
        first=0
```

48. In `print_forward`, why is `first` set to `0` only after the first value is printed, and not before the loop?

---

**`doubly_linked_list.sh`**
```sh
    local current="$head"
```

49. What would happen if `local current="$head"` were changed to `local current="$tail"` inside `print_forward`?

---

**`doubly_linked_list.sh`**
```sh
    local first=1
```

50. How does the `first` variable in `print_backward` serve the same purpose as in `print_forward`?

---

<sub>Generated by [grill-my-code](https://github.com/NSCC-ITC-Assessment/GrillMyCode) · deepseek/deepseek-v4-pro via openrouter · main</sub>
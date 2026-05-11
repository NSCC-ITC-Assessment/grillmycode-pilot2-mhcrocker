## Grill My Code

> **Generated:** 2026-05-11 16:01:02 UTC
> **Commits reviewed:** `1de625a` → `3d1bd53`

> **Files assessed:** `doubly_linked_list.sh`

---

**`doubly_linked_list.sh`**

```sh
set -euo pipefail
```

1. What is the purpose of the `set -euo pipefail` command in this script?

---

**`doubly_linked_list.sh`**

```sh
declare -a values=()
declare -a prev_idx=()
declare -a next_idx=()
```

2. What is the purpose of declaring `values`, `prev_idx`, and `next_idx` as arrays in this script?

---

**`doubly_linked_list.sh`**

```sh
head=-1
tail=-1
```

3. What do the variables `head` and `tail` represent in this script?

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

4. What is the purpose of the `append_node` function in this script?

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

5. What does the `local idx="${#values[@]}"` line do in the `append_node` function?

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

6. What is the purpose of the `if [[ $tail -ne -1 ]]` conditional in the `append_node` function?

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

7. What does the `next_idx[tail]="$idx"` line do in the `append_node` function?

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

8. What is the purpose of the `else` block in the `append_node` function?

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

9. What does the `tail="$idx"` line do in the `append_node` function?

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

10. What is the purpose of the `print_forward` function in this script?

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

11. What does the `local first=1` line do in the `print_forward` function?

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

12. What is the purpose of the `if [[ $first -eq 0 ]]` conditional in the `print_forward` function?

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

13. What does the `current="${next_idx[current]}"` line do in the `print_forward` function?

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

14. What is the purpose of the `print_backward` function in this script?

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

15. What does the `current="${prev_idx[current]}"` line do in the `print_backward` function?

---

**`doubly_linked_list.sh`**

```sh
echo "Enter values for the doubly-linked list."
echo "Type Q to quit and print the list."
```

16. What is the purpose of the `echo` statements at the beginning of the main loop in this script?

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

17. What is the purpose of the `while true; do` loop in this script?

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

18. What does the `read -r -p "Value: " input` line do in this script?

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

19. What is the purpose of the `if [[ "$input" == "Q" || "$input" == "q" ]]` conditional in this script?

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

20. What does the `append_node "$input"` line do in this script?

---

**`doubly_linked_list.sh`**

```sh
if [[ $head -eq -1 ]]; then
    echo "The list is empty."
    exit 0
fi
```

21. What is the purpose of the `if [[ $head -eq -1 ]]` conditional in this script?

---

**`doubly_linked_list.sh`**

```sh
if [[ $head -eq -1 ]]; then
    echo "The list is empty."
    exit 0
fi
```

22. What does the `exit 0` line do in this script?

---

**`doubly_linked_list.sh`**

```sh
print_forward
print_backward
```

23. What is the purpose of the `print_forward` and `print_backward` function calls at the end of this script?

---

**`doubly_linked_list.sh`**

```sh
set -euo pipefail
```

24. What does the `-e` option do in the `set -euo pipefail` command?

---

**`doubly_linked_list.sh`**

```sh
set -euo pipefail
```

25. What does the `-u` option do in the `set -euo pipefail` command?

---

**`doubly_linked_list.sh`**

```sh
set -euo pipefail
```

26. What does the `-o pipefail` option do in the `set -euo pipefail` command?

---

**`doubly_linked_list.sh`**

```sh
declare -a values=()
declare -a prev_idx=()
declare -a next_idx=()
```

27. What is the difference between `values`, `prev_idx`, and `next_idx` arrays in this script?

---

**`doubly_linked_list.sh`**

```sh
head=-1
tail=-1
```

28. Why are `head` and `tail` initialized to `-1` in this script?

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

29. What is the significance of the `local` keyword in the `append_node` function?

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

30. What does the `values[idx]="$value"` line do in the `append_node` function?

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

31. What does the `prev_idx[idx]="$tail"` line do in the `append_node` function?

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

32. What does the `next_idx[idx]=-1` line do in the `append_node` function?

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

33. What is the purpose of the `while [[ $current -ne -1 ]]` loop in the `print_forward` function?

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

34. What does the `printf '%s' "${values[current]}"` line do in the `print_forward` function?

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

35. What is the purpose of the `while [[ $current -ne -1 ]]` loop in the `print_backward` function?

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

36. What does the `printf '%s' "${values[current]}"` line do in the `print_backward` function?

---

**`doubly_linked_list.sh`**

```sh
echo "Enter values for the doubly-linked list."
echo "Type Q to quit and print the list."
```

37. What is the purpose of the `Type Q to quit and print the list` message in this script?

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

38. What does the `break` statement do in the `while true; do` loop?

---

**`doubly_linked_list.sh`**

```sh
if [[ $head -eq -1 ]]; then
    echo "The list is empty."
    exit 0
fi
```

39. What is the purpose of the `echo "The list is empty."` statement in this script?

---

**`doubly_linked_list.sh`**

```sh
print_forward
print_backward
```

40. What is the expected output format of the `print_forward` and `print_backward` functions?

---

**`doubly_linked_list.sh`**

```sh
set -euo pipefail
```

41. Why is the `set -euo pipefail` command used at the beginning of this script?

---

**`doubly_linked_list.sh`**

```sh
declare -a values=()
declare -a prev_idx=()
declare -a next_idx=()
```

42. What is the significance of declaring arrays with the `-a` option in this script?

---

**`doubly_linked_list.sh`**

```sh
head=-1
tail=-1
```

43. What do the `head` and `tail` variables represent in the context of a doubly-linked list?

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

44. What is the purpose of the `local` keyword in the `append_node` function?

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

45. What does the `values[idx]="$value"` line do in the `append_node` function?

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

46. What does the `prev_idx[idx]="$tail"` line do in the `append_node` function?

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

47. What does the `next_idx[idx]=-1` line do in the `append_node` function?

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

48. What is the purpose of the `local first=1` line in the `print_forward` function?

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

49. What does the `if [[ $first -eq 0 ]]` conditional do in the `print_forward` function?

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

50. What is the purpose of the `local first=1` line in the `print_backward` function?

---

<sub>Generated by [grill-my-code](https://github.com/NSCC-ITC-Assessment/GrillMyCode) · mistral-medium-2505 via github-models · main</sub>
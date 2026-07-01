#!/usr/bin/env bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="${UTIL_SCRIPTS_DIR:-$SCRIPT_DIR}"
ROFI_BIN="$(command -v rofi || true)"

if [[ -z "$ROFI_BIN" ]]; then
    echo "Missing rofi, please install it." >&2
    exit 1
fi

submenu_dir_for_script() {
    local script="$1"
    local candidate

    candidate="${script}.d"
    if [[ -d "$candidate" ]]; then
        printf '%s\n' "$candidate"
        return 0
    fi

    candidate="${script%.*}.d"
    if [[ -d "$candidate" ]]; then
        printf '%s\n' "$candidate"
        return 0
    fi

    return 1
}

menu_prompt() {
    local dir="$1"
    local title="${2-}"
    local rel="${dir#"$ROOT_DIR"}"
    rel="${rel#/}"

    if [[ -n "$title" ]]; then
        printf '%s\n' "Utilities / ${title}"
        return 0
    fi

    if [[ -z "$rel" ]]; then
        printf '%s\n' "Utilities"
    else
        printf '%s\n' "Utilities / ${rel}"
    fi
}

open_menu() {
    local dir="$1"
    local run_target="${2-}"
    local title="${3-}"
    local prompt
    local selection
    local target
    local submenu

    while true; do
        local -a labels=()
        local -A paths=()

        prompt="$(menu_prompt "$dir" "$title")"

        if [[ -n "$run_target" ]]; then
            local run_label="[run] $(basename "$run_target")"
            labels+=("$run_label")
            paths["$run_label"]="__RUN__"
        fi

        if [[ "$dir" != "$ROOT_DIR" ]]; then
            labels+=("< Back")
            paths["< Back"]="__BACK__"
        fi

        while IFS= read -r -d '' entry; do
            local base label
            base="$(basename "$entry")"

            [[ "$base" == .* ]] && continue

            if [[ -d "$entry" ]]; then
                [[ "$base" == *.d ]] && continue
                label="[dir] $base"
            elif [[ -f "$entry" && -x "$entry" ]]; then
                if submenu_dir_for_script "$entry" >/dev/null; then
                    label="[menu] $base"
                else
                    label="$base"
                fi
            else
                continue
            fi

            labels+=("$label")
            paths["$label"]="$entry"
        done < <(find "$dir" -mindepth 1 -maxdepth 1 -print0 | sort -z)

        if [[ "${#labels[@]}" -eq 0 ]]; then
            return 0
        fi

        if ! selection="$(
            printf '%s\n' "${labels[@]}" |
                "$ROFI_BIN" -dmenu -i -p "$prompt" -no-custom
        )"; then
            return 0
        fi

        [[ -z "$selection" ]] && return 0
        target="${paths["$selection"]:-}"

        case "$target" in
            "__BACK__")
                return 0
                ;;
            "__RUN__")
                "$run_target"
                return $?
                ;;
        esac

        if [[ -d "$target" ]]; then
            open_menu "$target" "" "" || true
            continue
        fi

        if [[ -f "$target" && -x "$target" ]]; then
            if submenu="$(submenu_dir_for_script "$target")"; then
                open_menu "$submenu" "$target" "$(basename "$target")" || true
            else
                "$target"
            fi
        fi

        return 0
    done
}

open_menu "$ROOT_DIR"

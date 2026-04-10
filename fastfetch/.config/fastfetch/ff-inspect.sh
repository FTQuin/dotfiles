#!/bin/bash
# Inspect all fastfetch module format variables and their output values
# Usage: ./ff-inspect.sh [module_type]
# Examples:
#   ./ff-inspect.sh          # all modules
#   ./ff-inspect.sh host     # just host
#   ./ff-inspect.sh battery  # just battery

tmpfile="/tmp/ff-inspect.jsonc"

get_modules() {
    if [ -n "$1" ]; then
        echo "$1"
    else
        fastfetch --list-modules 2>&1 | \
            awk -F: '{gsub(/^[0-9]+\)[ \t]+/, ""); gsub(/[ \t]+$/, ""); print $1}' | \
            grep -v -E '^(Break|Colors|Custom|Command|Logo|Separator)$'
    fi
}

for mod in $(get_modules "$1"); do
    # Get format help, skip modules with no format variables
    help=$(fastfetch -h "$(echo "$mod" | tr '[:upper:]' '[:lower:]')-format" 2>&1)
    if echo "$help" | grep -q "Unknown"; then
        continue
    fi

    # Extract variable names (lines with {varname})
    vars=$(echo "$help" | grep -oE '\{[a-z][-a-z]*\}' | sort -u)
    if [ -z "$vars" ]; then
        continue
    fi

    # Build modules array with one entry per variable
    modules=""
    for var in $vars; do
        varname=$(echo "$var" | tr -d '{}')
        entry="{\"type\":\"$mod\",\"key\":\"$mod.$varname\",\"format\":\"$var\"}"
        if [ -n "$modules" ]; then
            modules="$modules,$entry"
        else
            modules="$entry"
        fi
    done

    echo "{\"modules\":[$modules],\"display\":{\"percent\":{\"type\":[\"num\",\"bar\"]},\"bar\":{\"char\":{\"elapsed\":\"─\",\"total\":\"─\"},\"width\":15}}}" > "$tmpfile"

    echo "━━━ $mod ━━━"
    output=$(fastfetch --logo none -c "$tmpfile" 2>&1)
    if [ -n "$output" ]; then
        echo "$output" | while IFS= read -r line; do
            key="${line%%:*}"
            val="${line#*: }"
            if [ -z "$val" ] || [ "$val" = "$line" ]; then
                val="(empty)"
            fi
            printf "  %-35s %s\n" "$key:" "$val"
        done
    else
        # No data returned — list all variables with (no data)
        for var in $vars; do
            varname=$(echo "$var" | tr -d '{}')
            printf "  %-35s %s\n" "$mod.$varname:" "(no data)"
        done
    fi
    echo
done

rm -f "$tmpfile"

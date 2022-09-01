#!/bin/bash
items=("Item 1" "Item 2" "Item 3")
PS3=$'\nSelect an item > '
choices=()

toggleItem(){
    local newText
    local index=$(($1-1))
    local currentItem="${items[$index]}"

    if grep -q "✔️" <<< "$currentItem"; then # If currentItem has a ✔️
        currentItem="$currentItem"
        echo "This is theItem: '$currentItem'"
        choices=( ${choices[@]/$currentItem} ) # Remove currentItem from items
        newText=$(echo "$currentItem" | sed 's/ ✔️//')
    else
        newText="${items[$index]} ✔️"
        choices+=( "$newText" )
    fi

    items[$index]=$newText
}

showMenu(){
    while true; do
        select item in "${items[@]}" Quit
        do
            for selection in $REPLY
            do
                echo "selection: $selection"
                [ $selection == $((${#items[@]}+1)) ] && break 3; # Quit will always be the last option
                toggleItem $selection
            done

            echo "array: ${choices[@]}"
            break;
        done
    done

    echo "Choice list: ${choices[*]}"
    for el in $choices
    do
        echo "Your choices:"
        echo $el
    done
}
showMenu

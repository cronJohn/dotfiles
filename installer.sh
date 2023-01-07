#!/bin/bash
items=("Item 1" "Item 2" "Item 3")
PS3=$'\nSelect an item > '

toggleItem(){
    local newText
    local index=$(($1-1))
    local currentItem="${items[$index]}"

    if grep -q "✔️" <<< "$currentItem"; then # If currentItem has a ✔️
        newText=$(echo "$currentItem" | sed 's/ ✔️//')
    else
        newText="${items[$index]} ✔️"
    fi

    items[$index]=$newText
}

listChoices() {
    for element in "${items[@]}";
    do
        if grep -q "✔️" <<< "$element"; then # If currentItem has a ✔️
            echo "$element" | sed 's/ ✔️//'
        fi
    done
}

showMenu(){
    while true; do
        select item in "${items[@]}" Quit
        do
            for selection in $REPLY
            do
                [ $selection == $((${#items[@]}+1)) ] && break 3; # Quit will always be the last option
                toggleItem $selection
            done
            break;
        done
    done

    listChoices
}
showMenu

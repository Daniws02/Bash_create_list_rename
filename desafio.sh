create(){
    for i in $(seq 001 020)
    do
        touch "id_$hora:$minuto._$i.txt"
    done
}

list(){
    for i in `ls -v id_$hora:$minuto._*.txt`
    do
        echo "$i"
    done
}

rename() {
    for file in id_"$hora":"$minuto"._*.txt
    do
        new_name=$(echo "$file" | sed "s/$hora:$minuto/proc/")
        mv "$file" "$new_name"
    done
}

export TZ="America/Sao_Paulo"

hora=$(date +%H)
minuto=$(date +%M)

create

list

rename
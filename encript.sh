PRINT_ALGO=false
PRINT_TEXT=false

VAL='';

while getopts "atv:" OPTION
do
    case "${OPTION}" in
    a)
    PRINT_ALGO=true
    ;;  
    t)
    PRINT_TEXT=true
    ;;
    v)
    VAL="${OPTARG}"
    esac
done

ALGOS="sha1sum sha224sum sha256sum sha384sum sha512sum"

AL_ARR=($ALGOS)

for i in "${AL_ARR[@]}"
do
    if $PRINT_ALGO
    then
    echo "Algo name: ${i}"
    fi
    if $PRINT_TEXT
    then
    echo "Text: ${VAL}"
    fi
    TEMP=$(echo "${VAL}" | ${i} | head -c20)
    echo "Password : ${TEMP}"
done
exit
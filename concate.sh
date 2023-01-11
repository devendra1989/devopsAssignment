#!/bin/bash


str=$1
SLEN=${#str}
WORDS=$2
WORDS=(${WORDS//,/ })
WLEN=${#WORDS[0]} 
W_ARR_LEN=${#WORDS[@]} 

substr_size=$(($WLEN * $W_ARR_LEN))

if [[ "$SLEN" -lt "$substr_size" ]]
then
   echo "string size is not large enough"
   exit 1
fi

bar=$(IFS=, ; echo "${WORDS[*]}")
evalStr=''
for (( i=0 ; i < $W_ARR_LEN ; i++ ))
   do
      evalStr=$evalStr{${bar[@]}}
   done

CONCATENATED=$(eval echo ${evalStr[@]})

perm_array=()
echo "Please wait"
regex_exp='\b\w*(\w{'$WLEN'})\w*\1'

for el in $CONCATENATED
do
   (echo $el | grep -Eq  '\b\w*(\w{2})\w*\1') && discard=true 
   
   if [ "$discard" = false ]
      then
         perm_array+=($el)
      fi

   echo -ne "."
done

INDICES=()
for (( s=0 ; s<$SLEN ; s++ ))
do
   if [[ $(($SLEN - $s)) -lt $substr_size ]]
   then
      break;
   fi
   
   substr=${str:$s:$substr_size}
   if [[ " ${perm_array[*]} " =~ " ${substr} " ]]; 
   then
      INDICES+=($s)

   fi

done

echo -e "\n Indices:" ${INDICES[@]}

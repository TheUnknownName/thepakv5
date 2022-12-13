#!/bin/Bash

function error {
echo "
############################################
                getprop v1.1.1
############################################
how to use
$0 [type] [input file] [prop name] [value]
type: replace
      getname

If you use 'getvalue' just put prop name only
if you replace you need to specify value
"
exit
}

Type="$1"
file="$2"
varName="$3"
value="$4"

function replace {
if [[ $file == "" ]];then
echo "ERROR: please specify file input"
error
fi

if [[ $varName == "" ]];then
echo "ERROR: please specify prop name"
error
fi

if [[ $value == "" ]];then
echo "ERROR: please specify the value"
error
fi

flag_id="$(grep "$varName" $file | cut -d "=" -f1)"
flag_value="$(grep "$varName" $file | cut -d "=" -f2)"
echo "flag: $flag_id"
echo "----------------------------------"
echo "VALUE!!!"
echo "before: $flag_value"
echo "after: $value"
echo "changing value!!!!!!"
sed -i "s+$flag_id=$flag_value+$flag_id=$value+g" $file

}

function getvalue {
if [[ $file == "" ]];then
echo "ERROR: please specify file input"
error
fi

if [[ $varName == "" ]];then
echo "ERROR: please specify prop name"
error
fi

flag_id="$(grep "$varName" $file | cut -d "=" -f1)"
flag_value="$(grep "$varName" $file | cut -d "=" -f2)"
echo "$flag_value"
}

$type

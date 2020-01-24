#!/bin/bash -x

declare -A ResultsDictionary
read -p "Enter the value of a: " a
read -p "Enter the value of b: " b
read -p "Enter the value of c: " c

result1=`echo "$a + $b * $c" | bc`
result2=`echo "$a * $b + $c" | bc`
result3=`echo "scale=2; $c + $a / $b" | bc`
result4=`echo "$a % $b + $c" | bc`

ResultsDictionary[Expression_1]=$result1
ResultsDictionary[Expression_2]=$result2
ResultsDictionary[Expression_3]=$result3
ResultsDictionary[Expression_4]=$result4

for ((i=1; i<=4; i++))
do
	array[$i]=${ResultsDictionary[Expression_"$i"]}
done
echo ${array[@]}

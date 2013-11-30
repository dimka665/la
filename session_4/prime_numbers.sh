#!/bin/bash

usage() {
cat<<usage-end

Usage: ./prime_numbers.sh -n NUMBER [-f FILE] [-h] [-v]
List prime numbers

  -n,N NUMBER  list numbers <= NUMBER
  -f FILE      save output to FILE
  -h           show this description
  -v           verbose mode
usage-end
}

is_prime() {
    let max_divisor=$1/2
    for divisor in `seq 2 $max_divisor`; do
        if (( $1 % $divisor == 0 )); then
            if [ $verbose_mode ]; then
                echo -e "\n# $1 is not prime: divides evenly by $divisor"
            fi
            return 0
        fi
    done
    return 1
}

main() {
    for number in `seq 2 $1`; do
        if ! is_prime $number; then
            echo -n "$number "
        fi
    done
    echo ""
}

while getopts n:N:f:hv opt; do
    case $opt in
        n|N) to_number=$OPTARG;;
        f) output_file=$OPTARG;;
        h) print_help=true;;
        v) verbose_mode=true;;
    esac
done

if [ $to_number ]; then
    if [ $output_file ]; then
        if `> $output_file`; then
            if [ $verbose_mode ]; then
                echo "Saving result in file: $output_file"
            fi
        else
            echo "Can't write to '$output_file'"
            exit 1
        fi
        main $to_number | tee "$output_file"
    else
        main $to_number
    fi

elif [ $print_help ]; then
    usage

else
    echo "No number specified. Use -h option to get help."
    exit 1
fi

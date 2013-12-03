#!/bin/bash

factorial() {
    _accum=1
    for num in `seq 2 $1`; do
        let _accum*=num
    done
    echo ${_accum}
}

while ! [[ $number =~ ^[0-9]+$ ]]; do
    echo -n 'Enter positive integer: '
    read number
done

echo `factorial $number`

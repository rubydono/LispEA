#!/bin/bash --debugger

debugTrap(){
    echo +=== $BASH_COMMAND: >&2
    cirebi_trapped_cmd="$BASH_COMMAND"
    stdout="$( eval $cirebi_trapped_cmd )" 
    retval=$? 
    cat <<<"$stdout" 
    echo ===+ $retval >&2
    return 1
}

trap debugTrap DEBUG

echo test
ls -latch
/sbin/ip -f inet addr show
false

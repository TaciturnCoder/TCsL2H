#!/bin/bash

#//]: # ( ------------------------------------------------------------------ {c)
#//]: # ( COPYRIGHT 2022 Dwij Bavisi <dwijbavisi@gmail.com>                  {c)
#//]: # ( Licensed under:                                                    {c)
#//]: # (     Taciturn Coder's `License to Hack` License                     {c)
#//]: # (     TCsL2H 0.0.1                                                   {c)
#//]: # ( A copy of the License may be obtained from:                        {c)
#//]: # (     https://TaciturnCoder.github.io/TCsL2H/legalcode/0.0.1         {c)
#//]: # ( See the License for the permissions and limitations.               {c)
#//]: # ( ------------------------------------------------------------------ {c)

exit_success=0
exit_parameter_error=1
exit_config_error=3
exit_dependency_error=2
exit_root_error=4

name="TCsL2H"

argc=$#
if [ $argc -ne 1 ]; then
    config=".consortium.json"
    if [ ! -f "$config" ]; then
        echo "[$name] Speak $config and Enter"
        echo ""
        exit $exit_parameter_error
    fi
fi

if [ ! "$config" ]; then
    config="$1"
fi
if [ ! -f "$config" ]; then
    echo "[$name] Operation succesful. \"$config\" died?"
    echo ""
    exit $exit_config_error
fi

jq --version &>/dev/null
if [ $? -ne 0 ]; then
    echo "[$name] \"jq\" missing! Finding Nemo..."
    echo ""
    exit $exit_dependency_error
fi

license=$(cat "$config" | jq -cr ".config.license")
if [ ! -d "$license" ]; then
    echo "[$name] \"$license\" is a dead end!"
    echo ""
    exit $exit_root_error
fi

mkdir -p ".tmp"

. "$license/build/data.sh"

. "$license/build/header.sh"
. "$license/build/core.sh"

if [ "$license" = "." ]; then
    . "$license/build/docs.sh"
fi

exit $exit_success

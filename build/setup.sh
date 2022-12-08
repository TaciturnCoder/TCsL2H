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

python="python"
if ! [ -x "$(command -v $python)" ]; then
    python="python3"
    if ! [ -x "$(command -v $python)" ]; then
        echo "[TCsL2H] \"python\" missing! Finding Nemo..."
        echo ""
        exit 1
    fi
fi

root="."
ctm="$root/.modules/Consortium"

action=$1
config=$2

if [ -z "$action" ]; then
    echo "[TCsL2H] Speak action and Enter."
    echo ""
    exit 1
fi

if [ -z "$config" ]; then
    config=".consortium.json"
fi
if [ ! -f "$config" ]; then
    echo "[TCsL2H] Operation succesful. \"$config\" died?"
    echo ""
    exit 1
fi

function from_config() {
    $python "$ctm/src/extract.py" "$@" --config $config
}

ctm=$(from_config "Consortium.root" | tr -d '"')
root=$(from_config "TCsL2H.root" | tr -d '"')

mkdir -p "$root/.tmp"

case $action in
header)
    . "$root/build/header.sh"
    ;;
core)
    . "$root/build/core.sh"
    ;;
docs)
    . "$root/build/docs.sh"
    ;;
*) ;;
esac

$python "$ctm/src/extract.py" --clean --config $config
exit 0

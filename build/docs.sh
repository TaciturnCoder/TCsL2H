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

. "$root/build/core.sh"

mkdir -p "docs/legalcode"

docs_out="docs/legalcode/$revision.$patch.$draft.md"

cat "$root/.tmp/core.md" >"$docs_out"
cat "ReadMe.md" >"docs/ReadMe.md"
cat "License.md" >"docs/License.md"

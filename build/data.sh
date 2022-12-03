#!/bin/bash

#//]: # ( ------------------------------------------------------------------ {c)
#//]: # ( COPYRIGHT 2022 Dwij Bavisi <dwijbavisi@gmail.com>                  {c)
#//]: # ( Licensed under:                                                    {c)
#//]: # (     Taciturn Coder's `License to Hack` License                     {c)
#//]: # (     TC's L2H 1.0                                                   {c)
#//]: # ( A copy of the License may be obtained from:                        {c)
#//]: # (     https://TaciturnCoder.github.io/TCsL2H/legalcode/1.0           {c)
#//]: # ( See the License for the permissions and limitations.               {c)
#//]: # ( ------------------------------------------------------------------ {c)

revision=$(cat "$config" | jq -cr ".license.version.revision")
patch=$(cat "$config" | jq -cr ".license.version.patch")
draft=$(cat "$config" | jq -cr ".license.version.draft")
release=$(cat "$config" | jq -cr ".license.version.release")
build=$(cat "$config" | jq -cr ".license.version.build")

year=$(cat "$config" | jq -cr ".license.year")
licensor=$(cat "$config" | jq -cr ".license.licensor")

core_skip=10
core_Defs="$license/src/core/Defs.md"
core_Grants="$license/src/core/Grants.md"
core_Conditions="$license/src/core/Conditions.md"
core_Limitations="$license/src/core/Limitations.md"
core_Termination="$license/src/core/Termination.md"
core_out="$license/.tmp/core.md"

header_skip=11
header_Template="$license/src/header/Template.md"
header_out="$license/.tmp/header.md"

dos2fs='s/\r//g'

max_chars=80
comment_begin="[//]: # ( "
comment_end=" {c)"
comment_fill=$((max_chars - (${#comment_begin} + ${#comment_end})))
seperator=""
for i in $(seq 1 $comment_fill); do
    seperator="-$seperator"
done

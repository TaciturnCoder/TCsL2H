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

revision=0
patch=0
draft=1

year=$(from_config "TCsL2H.year" | tr -d '"')
name=$(from_config "TCsL2H.licensor.name" | tr -d '"')
email=$(from_config "TCsL2H.licensor.email" | tr -d '"')

if [ "$email" != "null" ]; then
    licensor="$name <$email>"
else
    licensor="$name"
fi

header_skip=11
header_template="$root/src/header/Template.md"
header_out="$root/.tmp/header.md"

dos2fs='s/\r//g'

max_chars=80
comment_begin="[//]: # ( "
comment_end=" {c)"
comment_fill=$((max_chars - (${#comment_begin} + ${#comment_end})))
seperator=""
for i in $(seq 1 $comment_fill); do
    seperator="-$seperator"
done

header="$seperator
$(tail +$header_skip $header_template | sed $dos2fs)
$seperator"

header=$(echo "$header" | sed 's/$year/'"$year"'/g')
header=$(echo "$header" | sed 's/$licensor/'"$licensor"'/g')

header=$(echo "$header" | sed 's/$revision/'$revision'/g')
header=$(echo "$header" | sed 's/$patch/'$patch'/g')
header=$(echo "$header" | sed 's/$draft/'$draft'/g')

IFS='
'
header=$(printf "$comment_begin%-$comment_fill""s$comment_end\n" $header)

echo "$header" >$header_out

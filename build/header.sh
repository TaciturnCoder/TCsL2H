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

if [ "$mail" != "null" ]; then
    licensor="$author <$mail>"
else
    licensor="$author"
fi

header_skip=11
header_template="src/header/Template.md"
header_out=".tmp/header.md"

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

header=$(echo "$header" | sed 's/$revision/'$_r'/g')
header=$(echo "$header" | sed 's/$patch/'$_p'/g')
header=$(echo "$header" | sed 's/$draft/'$_d'/g')

IFS='
'
header=$(printf "$comment_begin%-$comment_fill""s$comment_end\n" $header)

echo "$header" >$header_out

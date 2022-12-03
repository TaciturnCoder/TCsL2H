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

header="$seperator
$(tail +$header_skip $header_Template | sed $dos2fs)
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

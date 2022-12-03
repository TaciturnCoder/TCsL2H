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

core_title="# Taciturn Coder's \`License to Hack\` License
TCsL2H $revision.$patch.$draft"

defs="$(tail +$core_skip $core_Defs | sed $dos2fs)"
grants="$(tail +$core_skip $core_Grants | sed $dos2fs)"
conds="$(tail +$core_skip $core_Conditions | sed $dos2fs)"
limits="$(tail +$core_skip $core_Limitations | sed $dos2fs)"
term="$(tail +$core_skip $core_Termination | sed $dos2fs)"

core="$header

$core_title

## Definitions
--------------
$defs

## Permissions
--------------
$grants

## Conditions
-------------
$conds

## Limitations
--------------
$limits

## Termination
--------------
$term"

echo "$core" >$core_out

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

schema_config="src/header/.consortium.json"

mkdir -p ".tmp"

_r=$(ctm_extract --raw "version.revision" --config "$schema_config")
_p=$(ctm_extract --raw "version.patch" --config "$schema_config")
_d=$(ctm_extract --raw "version.draft" --config "$schema_config")

year=$(ctm_extract --raw "license.year" --config "$schema_config")
author=$(ctm_extract --raw "license.licensor.author" --config "$schema_config")
mail=$(ctm_extract --raw "license.licensor.mail" --config "$schema_config")

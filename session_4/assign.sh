#!/bin/bash

<<comment-block
Script does by order:
- Read workers list and work table files names from 'settings.conf'
- Write sorted worker list from 'names' to file
- Print tasks list from 'tasks' to screen
- Save stdout in 6th descriptor and redirect stdout to file
- Assign tasks to workers and write to file through stdout
- Restore stdout from 6th descriptor and close 6th descriptor
- Print workers list and work table files names to screen
comment-block

source settings.conf
workers_list=${workers_list-workers.lst}
work_table=${work_table-work.table}

# sort names and write to workers list file with format:
# [line-number] name [name-length]
cat names | sort | awk '$0 = "["NR"] " $0 " ["length"]"' > "$workers_list"

# replace spaces to underscore in tasks and print
echo "Current tasks:"
cat tasks | sed 's/\s\+/_/g'

# save stdout in 6 and redirect to file
exec 6<&1 >"$work_table"

# assign tasks
echo "Assigned tasks:"
paste names tasks -d==
date +"Date: %m/%d/%Y Time: %T"

# restore stdout from 6 and close 6
exec 1<&6 6>&-

# print file names
cat<<end-of-message

Assigning: DONE
Workers list: $workers_list
Assigned tasks table: $work_table
end-of-message

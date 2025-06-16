#!/bin/bash

(echo "user rss(KiB) vmem(KiB)";
 for user in $(awk -F':' '{ print $1}' /etc/passwd); do
   echo $user $(ps -U $user --no-headers -o rss,vsz \
     | awk '{rss+=$1; vmem+=$2} END{print rss" "vmem}')
 done | sort -r -nk2
) | column -t





























# !/bin/bash

# # Initialize the total memory usage variable
# total_mem=0     

# # Print column headers
# printf "%-10s%-10s\n" User MemUsage'(%)'

# # Loop through the sorted output of ps and calculate the memory usage per user
# while read u m
# do
#     # Check if we're on a new user and print the total memory usage for the previous user
#     [[ $old_user != $u ]] && { printf "%-10s%-0.1f\n" $old_user $total_mem; total_mem=0; }

#     # Add the memory usage of the current process to the total memory usage
#     total_mem="$(echo $m + $total_mem | bc)"    

#     # Save the current user for the next iteration
#     old_user=$u

# # Read the output of ps, sort it by user, and loop through it
# done < <(ps --no-headers -eo user,%mem| sort -k1)    

# #EOF
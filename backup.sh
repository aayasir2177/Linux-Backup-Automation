#!/bin/bash

# vars
backup_src="/home/yasir/imp_files"
backup_mount="/mnt/backup/"
backup_dest="$backup_mount/current"
current_date=$(date +%Y-%m-%d)
log_path="$backup_mount/logs"
incremental_backups="$backup_mount/incremental_backups/$current_date"

#checking nfs mount
#if ! mountpoint -q $backup_mount; then 
#	echo "ERROR: Backup directory isn't mounted!"
#	exit 1
#fi

# create dirs
mkdir -p "$log_path"
mkdir -p "$incremental_backups"

# run rsync
rsync \
	--archive \
	--verbose \
	--backup \
	--backup-dir="${incremental_backups}" \
	"${backup_src}" \
	"${backup_dest}" \
	> "$log_path/backup_${current_date}.log" \
	2> "$log_path/backup_${current_date}_error.log" 

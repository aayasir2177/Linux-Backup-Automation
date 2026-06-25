# Linux Backup Automation with rsync, systemd, and NFS

## Overview

This project implements an automated Linux backup solution, which I wrote using bash and it uses rsync, NFS, and a systemd service + timer.

It provides incremental backups, logging, and fully automated execution without manual intervention.

---

## How It Works

1. backup.sh runs rsync to sync files from source to /mnt/backup/
2. Backups are stored in:
   - current/
   - incremental_backups/YYYY-MM-DD/
3. Logs are saved in /mnt/backup/logs/
4. systemd timer triggers the backup daily

---

## Setup

### 1. Set permissions

```bash
chmod 755 backup.sh
sudo chown root:root backup.sh
```

---

### 2. Move script to system path

```bash
sudo cp backup.sh /usr/local/bin/
```

---

### 3. Create systemd service and timer

```bash
sudo cp backup.service backup.timer /etc/systemd/system/
sudo systemctl daemon-reload
```

---

### 4. Enable timer

```bash
sudo systemctl enable --now backup.timer
```

---

### 5. Mount NFS mount point

```bash
sudo mkdir -p /mnt/backup/
sudo vim /etc/fstab
192.168.122.68:/nfs/share /mnt/backup/ nfs defaults 0 0
```

---

### 6. Test manually

```bash
sudo systemctl start backup.service
sudo systemctl status backup.service
```

---

## Features

- Automated backups 
- Incremental backup 
- Timestamp-based backup folders
- Centralized NFS storage
- Logging for success and error tracking

---

## What I learned?

- systemd service and timer creation
- bash scripting
- NFS integration
- real-world backup design

## Screenshots

<img width="1504" height="594" alt="image" src="https://github.com/user-attachments/assets/e9efac70-a3e2-423e-ad40-9abc766d46b7" />

<img width="1504" height="327" alt="image" src="https://github.com/user-attachments/assets/5c5b1f41-5da2-4aee-a0fd-753bb04e5cc7" />

<img width="715" height="704" alt="image" src="https://github.com/user-attachments/assets/4f3279a9-dfae-4190-8d08-125bdf10c9ca" />

<img width="1097" height="283" alt="image" src="https://github.com/user-attachments/assets/ff912c89-fc76-4120-9b5b-2fb02fb7220b" />




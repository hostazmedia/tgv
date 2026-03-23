---
description: how to deploy code to VPS1 or VPS2 using blue-green (zero-downtime) deployment
---
// turbo-all

# Blue-Green Deploy Workflow

> **RULE:** ALWAYS use this workflow when deploying code changes to VPS1 or VPS2.
> NEVER build directly in the live directory. This prevents 502 errors and downtime.

## Architecture

```
/var/www/qifeipay     → symlink to current active release
/var/www/releases/
  ├── current/        → the currently running release
  └── staging/        → build new release here, then swap
```

## VPS Connection Info

| VPS | Host | User | SSH |
|-----|------|------|-----|
| VPS1 | 202.92.5.198 | ubuntu | `ssh ubuntu@202.92.5.198` |
| VPS2 | 51.79.213.69 | root | `ssh root@51.79.213.69` |

## VPS1 npm path
```
export PATH=/home/ubuntu/.nvm/versions/node/v20.20.1/bin:$PATH
```

## VPS2 npm path
```
source /root/.nvm/nvm.sh
```

---

## ✅ Pre-deploy Checklist (BẮT BUỘC — chạy TRƯỚC mọi deploy)

```
□ 1. Đọc CRITICAL_PATHS.md — file đang sửa có trong danh sách critical không?
□ 2. Grep biến undefined trong mỗi file đã sửa
□ 3. Kiểm tra KHÔNG có empty catch {} — phải log error
□ 4. Kiểm tra KHÔNG có biến/hàm chưa import
□ 5. Backup file gốc trước khi ghi đè (step 1 bên dưới)
```

## Deploy Steps

### 0. Backup file gốc (BẮT BUỘC)
```bash
# Backup TRƯỚC khi copy file mới vào staging
ssh <user>@<host> "cp /var/www/releases/staging/src/<path>/<file> /tmp/backup_<file>_$(date +%Y%m%d_%H%M%S)"
```

### 1. Copy changed files to VPS staging directory
```bash
# SCP files to /tmp/ first, then copy to staging
scp -o ConnectTimeout=15 <local_file> <user>@<host>:/tmp/<filename>
ssh <user>@<host> "cp /tmp/<filename> /var/www/releases/staging/src/<path>/<filename>"
```

### 2. Build in staging directory (NOT in live directory)
```bash
# VPS1:
ssh ubuntu@202.92.5.198 "export PATH=/home/ubuntu/.nvm/versions/node/v20.20.1/bin:\$PATH && cd /var/www/releases/staging && npm run build 2>&1 | tail -10"

# VPS2:
ssh root@51.79.213.69 "source /root/.nvm/nvm.sh && cd /var/www/releases/staging && npm run build 2>&1 | tail -10"
```

### 3. Verify build succeeded
Check the output contains `✓ Ready` or `○ (Static)` lines. If build fails, staging is broken but live is still running — no downtime.

### 4. Atomic swap (zero-downtime)
```bash
# Swap symlink — this is instant
ssh <user>@<host> "ln -sfn /var/www/releases/staging /var/www/qifeipay"

# Restart PM2 to pick up new code
ssh <user>@<host> "<npm_path_export> && pm2 restart qifeipay"
```

### 5. Post-deploy verify (BẮT BUỘC)
```bash
# Check pm2 logs — grep for errors
ssh <user>@<host> "<npm_path_export> && pm2 logs qifeipay --lines 10 --nostream 2>&1 | grep -i 'error\|undefined\|crash'"

# Verify app responds
ssh <user>@<host> "curl -s -o /dev/null -w '%{http_code}' http://localhost:3000/api/branding"
```

### 6. Prepare for next deploy (swap staging/current names)
```bash
ssh <user>@<host> "mv /var/www/releases/staging /var/www/releases/new_current && mv /var/www/releases/current /var/www/releases/staging && mv /var/www/releases/new_current /var/www/releases/current"
```
Now `current` has the NEW code, `staging` has the OLD code (ready as rollback or next deploy base).

## Rollback (if something goes wrong)
```bash
# Point symlink back to previous release
ssh <user>@<host> "ln -sfn /var/www/releases/staging /var/www/qifeipay && <npm_path_export> && pm2 restart qifeipay"
```

## First-time Setup (run once per VPS)
```bash
# Create releases directory structure
mkdir -p /var/www/releases

# Copy current live code as the "current" release
cp -a /var/www/qifeipay /var/www/releases/current

# Copy again as "staging" (build target)
cp -a /var/www/qifeipay /var/www/releases/staging

# Replace live directory with symlink
rm -rf /var/www/qifeipay
ln -sfn /var/www/releases/current /var/www/qifeipay

# Verify symlink works
ls -la /var/www/qifeipay
pm2 restart qifeipay
```

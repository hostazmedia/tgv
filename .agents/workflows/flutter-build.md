---
description: how to build and run flutter commands for this project
---
// turbo-all

# Flutter APK Build Workflow

> **RULE:** ALWAYS check branding and URL config before building.
> Source: `c:\Antigravity\Congthanhtoan\flutter_app`
> Flutter SDK: `C:\Antigravity\flutter\bin\flutter.bat`

## Pre-build Checklist

### 1. Confirm target VPS URL
Check `login_screen.dart` line 17:
```dart
static const _serverUrl = 'https://qifeipay.it.com';  // VPS2
// static const _serverUrl = 'https://qifeipay.com';   // VPS1
```

### 2. Confirm branding
- **AndroidManifest.xml** line 4: `android:label="QiFeiPay"`
- **pubspec.yaml** line 19: version bump (increment build number)
- Logo: fetched dynamically from `/api/branding`

### 3. Check current version
```powershell
Select-String -Path "c:\Antigravity\Congthanhtoan\flutter_app\pubspec.yaml" -Pattern "version:"
```

## Build Steps

### 4. Build release APK
```powershell
Push-Location c:\Antigravity\Congthanhtoan\flutter_app; C:\Antigravity\flutter\bin\flutter.bat build apk --release; Pop-Location
```

### 5. Verify output
APK will be at:
```
c:\Antigravity\Congthanhtoan\flutter_app\build\app\outputs\flutter-apk\app-release.apk
```

### 6. Check APK size (should be ~49MB)
```powershell
Get-Item "c:\Antigravity\Congthanhtoan\flutter_app\build\app\outputs\flutter-apk\app-release.apk" | Select-Object Name, @{N='SizeMB';E={[math]::Round($_.Length/1MB,1)}}
```

## Post-build
- Send APK to user for distribution
- Note: After installing, user MUST enable **Notification Access** in device Settings for the app

## URL Reference
| VPS | `_serverUrl` |
|-----|-------------|
| VPS1 (qifeipay.com) | `https://qifeipay.com` |
| VPS2 (qifeipay.it.com) | `https://qifeipay.it.com` |

## Important Notes
- Cwd MUST be `C:\Antigravity\AppCy` (workspace restriction), use `Push-Location` to change dir
- `flutter` is NOT in PATH — use full path `C:\Antigravity\flutter\bin\flutter.bat`
- Branding (name, logo) fetched from server `/api/branding` at runtime
- App label in AndroidManifest is what shows on Android home screen

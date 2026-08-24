# AlphaOS

AlphaOS is a Debian based Linux distribution built with
`live-build`.

The project generates a bootable amd64 ISO with a graphical installer and
desktop environment.

## Base System

- Debian
- amd64
- UEFI boot
- GRUB
- Calamares installer
- KDE Plasma
- SDDM
- systemd

## Requirements

Use a Debian amd64 build system.

Install the required packages:

```bash
sudo apt update

sudo apt install \
    live-build \
    debootstrap \
    squashfs-tools \
    xorriso \
    grub-pc-bin \
    grub-efi-amd64-bin \
    mtools \
    dosfstools
```

## Build Commands

### Clean

```bash
sudo lb clean --purge
```

### Configure
```bash
sudo ./auto/config
```
### Build
```bash
sudo ./auto/build
```

## Future Goals

AlphaOS is planned to evolve into a lightweight, performance-focused
operating system with a strong focus on gaming and desktop performance.

Planned goals include:

- Gaming-optimized system configuration
- Better CPU and GPU performance
- Low-latency system tuning
- Improved gaming compatibility
- Optimized graphics stack
- Better Steam and gaming-platform integration
- Reduced background resource usage
- Faster boot and application startup
- Hardware-aware performance profiles
- Optional gaming mode
- Improved laptop power and thermal management
- Modern desktop experience without unnecessary system overhead

The long-term goal is to make AlphaOS a practical **gaming-optimized Linux
distribution** while keeping it suitable for everyday desktop use.

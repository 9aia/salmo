# Salmo

> [!WARNING]
> It's a work-in-progress. Expect potential bugs, incomplete or not yet implemented features.

Salmo is a simple framework for managing ArchLinux-based personal desktop environments and setting up bootable USB drives for it. It consists of two main tools:

## Components

### Salmo - Desktop Environment Manager
A simple framework for managing your personal desktop environment configuration. It provides:
- **Configuration Management**: Apply configuration files and settings across your system
- **Package Management**: Install packages from custom package lists
- **Development Workflow**: Hot-reload capabilities for development environments
- **Custom CLI Generation**: Build production-ready CLI tools with USB setup and post-boot installation commands

### Salmox - USB Boot Setup Tool
A specialized tool for creating bootable USB drives and installing desktop environments:
- **USB Setup**: Download Arch Linux ISO and create bootable USB drives using Ventoy
- **Desktop Installation**: Complete desktop environment installation with automated configuration
- **System Setup**: Automated system configuration and setup processes

## Features

- **Modular Architecture**: Shared libraries for logging and utilities
- **Configuration-Driven**: YAML-based configuration for easy customization
- **Dry-Run Support**: Preview changes before applying them
- **Flexible Package Management**: Support for custom package lists and configurations
- **Development Tools**: Built-in development workflow with hot-reload capabilities

## Contribute

Please refer to our [Contributing Guidelines](./CONTRIBUTING.md) for detailed instructions on how to contribute to the project.

---

[License](./LICENSE) • [Security](./SECURITY.md)

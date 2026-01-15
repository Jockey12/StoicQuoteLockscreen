# StoicQuoteLockscreen

A lockscreen widget that displays random Stoic quotes from an API using Quickshell.

## Prerequisites

- **end4 dots Hyprland** - This project requires end4 dots Hyprland configuration to work properly.
- **Quickshell** - A QML-based shell for creating custom widgets.

## Installation

### 1. Edit shell.qml

First, edit the shell configuration file:

```bash
~/.config/quickshell/ii/shell.qml
```

Add the StoicQuote service to your shell configuration.

### 2. Create StoicQuote.qml Service

Create a new file for the Stoic quote service:

```bash
~/.config/quickshell/ii/services/StoicQuote.qml
```

This file will contain the QML code for fetching and displaying random Stoic quotes.

## Usage

Once installed and configured, the widget will display random Stoic quotes on your lockscreen.

## Features

- Fetches random Stoic quotes from API
- Integrates seamlessly with Hyprland lockscreen
- Uses Quickshell for rendering

## Credits

Built for use with end4 dots Hyprland configuration.

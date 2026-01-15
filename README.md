# Stoic Quote Integration for Quickshell
Random Stoic quotes from https://stoic.tekloon.net/stoic-quote displayed on the lockscreen for quickshell. 
- [End4 dots](https://github.com/end-4/dots-hyprland)

## Features

### 1. Login Notification
- Shows a notification with a random Stoic quote 2 seconds after Quickshell starts
- Notification displays for 10 seconds

### 2. Lock Screen Widget  
- Displays a quote below your clock when screen is locked
- Fetches a fresh quote each time you lock
- word-wrapping for long quotes

## Files Required

1. **`~/.config/quickshell/ii/services/StoicQuote.qml`**
   - Singleton service that fetches quotes from the API
   - Auto-loads when Quickshell starts
   - Provides: `StoicQuote.data.quote` and `StoicQuote.data.author`

2. **`~/.config/quickshell/ii/modules/ii/background/widgets/clock/StoicQuoteWidget.qml`**
   - Visual widget component for displaying quotes
   - Shows on lock screen below clock
   - Fetches new quote when loaded

## Files Modified

1. **`~/.config/quickshell/ii/shell.qml`**
   - Added `import qs.services`
   - Added timer to show notification 2s after startup

2. **`~/.config/quickshell/ii/modules/ii/background/widgets/clock/ClockWidget.qml`**
   - Added `FadeLoader` for StoicQuoteWidget
   - Shows when `GlobalStates.screenLocked` is true

## Customization

### Change notification timing:
Edit `~/.config/quickshell/ii/shell.qml`, find `interval: 2000` and change milliseconds

### Change quote position on lock screen:
Edit `~/.config/quickshell/ii/modules/ii/background/widgets/clock/ClockWidget.qml`

### Change quote styling:
Edit `~/.config/quickshell/ii/modules/ii/background/widgets/clock/StoicQuoteWidget.qml`

### Disable login notification:
Comment out or remove the timer code in `shell.qml` Component.onCompleted

### Disable lock screen quote:
Comment out or remove the `stoicQuoteLoader` FadeLoader in `ClockWidget.qml`

## How It Works

1. **On Startup:** StoicQuote service fetches a quote from API
2. **After 2s:** Notification shows with the quote
3. **On Lock:** StoicQuoteWidget loads and fetches a fresh quote
4. **Display:** Quote appears below clock with fade-in animation

## Troubleshooting

### No notification appears:
- Check if `notify-send` is installed: `which notify-send`
- Check quickshell logs: `tail -f /run/user/1000/quickshell/*/log.qslog`

### Quote doesn't show on lock screen:
- Verify clock widget is visible when locked
- Check if `GlobalStates.screenLocked` is being set
- Look for errors in quickshell logs

### API errors:
- Verify internet connection
- Test API manually: `curl https://stoic.tekloon.net/stoic-quote`

## API Response Format

```json
{
  "data": {
    "quote": "The quote text...",
    "author": "Author Name"
  }
}
```

Enjoy your daily dose of Stoic wisdom! 🏛️

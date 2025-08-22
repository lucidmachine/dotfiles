# ADR 001: Selection of Calendar Apps

## Context

## Requirements

### Need to Have

- Local
- File-based configuration
- Multiple calendars
- CalDAV synchronization:
    - Personal calendars are presently in [Google Calendar, which uses
      CalDAV](https://developers.google.com/workspace/calendar/caldav/v2/guide). Personal calendars
      will probably be migrated out of Google Calendar.
    - Multiple shared calendars are presently in Google Calendar, which uses CalDAV. Others'
      calendars are unlikely to be migrated out of Google Calendar.
- System Notifications
- Low power consumption

### Nice to Have

- Email Notifications
- STDOUT for scripting
 

## Options

- [khal](https://github.com/pimutils/khal) + [vdirsyncer](https://github.com/pimutils/vdirsyncer) +
  cron + Python
    - Pro: Multiple calendars
    - Pro: CalDAV sync program
    - Pro: Configurable formats and colors
    - Pro: Hook scripts
    - Pro: Interactive search
    - Con: Notifications handled by custom cron scripts
- [calcurse](https://calcurse.org/):
    - Con: Single calendar?
    - Mid: CalDAV sync script
    - Pro: Configurable formats and colors
    - Pro: Hook scripts
    - Con: No interactive search
    - Pro: Configurable notification commands
- [calcure](https://github.com/anufrievroman/calcure)
    - Con: Automatic icon assignment
    - Con: Unintuitive key bindings
    - Con: No configurable layouts


## Outcome

khal + vdirsyncer + cron + Python

Support for multiple calendars, the relative ease of configuring vdirsyncer, and the wide array of
display and query methods outweigh the integrated notification system of calcurse.


#adr #calendar #khal #calcurse

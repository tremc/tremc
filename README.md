Die python2 die.

This is the python3 fork of https://github.com/fagga/transmission-remote-cli

## About

A console client for the BitTorrent client
[Transmission](http://www.transmissionbt.com/ "Transmission Homepage").

## Requirements

Python 3.0 bitch.

### Optional Modules

- python-GeoIP: Guess which country peers come from.
- [python-pyperclip](https://pypi.org/project/pyperclip/): Copy magnet links to the system
  clipboard. You will also need either xclip on linux or pbcopy on OS X for this
  to work.
- python3-adns: Resolve IPs to host names. (untested)

## Usage

### Connection information

Authentication and host/port can be set via command line with one
of these patterns:

`$ tremc -c homeserver`

`$ tremc -c homeserver:1234`

`$ tremc -c johndoe:secretbirthday@homeserver`

`$ tremc -c johndoe:secretbirthday@homeserver:1234`

You can write this (and other) stuff into a configuration file:

`$ tremc -c johndoe:secretbirthday@homeserver:1234 --create-config`

No configuration file is created automatically. You must create it.
`$ tremc --create-config

If you don't like the default configuration file path
~/.config/tremc/settings.cfg, change it:

`$ tremc -f ~/.tremc --create-config`


### Calling transmission-remote

tremc forwards all arguments after '--' to transmission-remote.
This is useful if your daemon requires authentication or doesn't listen on the
default localhost:9091.
tremc reads HOST:PORT and authentication from the config file and forwards them
to transmission-remote, along with your arguments.

Some examples:

`$ tremc -- -l`

`$ tremc -- -t 2 -i`

`$ tremc -- -as`


### Add torrents

If you provide only one command line argument and it doesn't start with '-',
it's treated like a torrent file/URL and submitted to the daemon via
transmission-remote. This is useful because you can instruct Firefox to open
torrent files with tremc.

`$ tremc http://link/to/file.torrent`

`$ tremc path/to/some/torrent-file`


## Screenshots

![Main window - full](screenshots/screenshot-mainfull-v1.3.png)

![Main window - compact](screenshots/screenshot-maincompact-v1.3.png)

![Details window](screenshots/tremc-details-20171214.png)


## Copyright

Released under the GPLv3 license, see [COPYING](COPYING) for details.

## Contact

Feel free to request new features or provide bug reports.
https://github.com/tremc/tremc

Die python2 die.

This is the python3 fork of https://github.com/fagga/transmission-remote-cli
Some extra modifications have been included and development will follow the
original project as much as possible. No new features are planned.

## About

A console client for the BitTorrent client
[Transmission](http://www.transmissionbt.com/ "Transmission Homepage").

## Requirements

Python 3.0 bitch.

### Optional Modules (you don't need them but they add features):

- GeoIP: Guess which country peers come from.
- adns: Resolve IPs to host names.
- [xerox](https://pypi.python.org/pypi/xerox): Copy magnet links to the system
  clipboard. You will also need either xclip on linux or pbcopy on OS X for this
  to work.

Debian/Ubuntu package names are `python-adns` and `python-geoip`.


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

No configuration file is created automatically, you have to do this
somehow. However, if the file exists, it is re-written when trcli exits to
remember some settings. This means you shouldn't have trcli running when
editing your configuration file.

If you don't like the default configuration file path
~/.config/tremc/settings.cfg, change it:
`$ tremc -f ~/.trclirc --create-config`


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

![Main window - full, v1.3](https://github.com/louipc/tremc/raw/master/screenshots/screenshot-mainfull-v1.3.png)

![Main window - compact, v1.3](https://github.com/louipc/tremc/raw/master/screenshots/screenshot-maincompact-v1.3.png)

![Info window, v1.3](https://github.com/louipc/tremc/raw/master/screenshots/screenshot-details-v1.3.png)


## Copyright

Released under the GPLv3 license, see [COPYING](COPYING) for details.

## Contact

Feel free to request new features or provide bug reports.
http://github.com/louipc/tremc

This is the python3 fork of https://github.com/fagga/transmission-remote-cli

## About

A console client for the BitTorrent client
[Transmission](http://www.transmissionbt.com/ "Transmission Homepage").

## Requirements

Python 3.2

### Optional Modules

- python-GeoIP or python-GeoIP2: Guess which country peers come from.
- [python-pyperclip](https://pypi.org/project/pyperclip/): Copy magnet links to the system clipboard. You will also need either xclip on linux or pbcopy on OS X for this to work.

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

### Main user interface

`tremc` has two display modes: torrents list view and torrent details view.
In details view there are five tabs: overview, files, peers, trackers and chunks.

In list view, as well as in the files and trackers one item may be focused.
In list view and the files tab, a set of items may also be selected.

`tremc` is controlled by the keyboard. In the following list of key bindings case matters and ^ is used for the Control key.

#### Keys that work in both modes:
* Vertical movement keys:
  * Up, k, ^p		: move one line up
  * Down, k, ^n		: move one line down
  * PageUp, ^b		: move one screen up
  * PageDown, ^f	: move one screen down
  * Home, g 		: move to top
  * End, G	 		: move to bottom

In list view, files tab and trackers tab, the focused item is moved, and the display scrolled to keep the focused item viewable. In the other tabs, only the display is scrolled if there is more than one screen to display.

* ?, F1	: Display help window
* ^w	: Quit `tremc` immediately
* X		: Send the quit command to the daemon
* S		: Show session statistics
* M 	: Copy magnet link to clipboard (if the pyperclip module is available)
* B		: Set labels (labels require transmission 3.0 or later) +
* b		: Add label +
* ^l	: Remove label
* F		: Rename focused file (or torrent, if no file is focused)
* N		: Start torrent now +
* p		: Pause/unpause torrent +
* P		: Pause/unpause all torrents
* n		: Reannounce torrent +
* v, y	: Verify torrent +
* \-		: Decrease torrent priority +
* \+		: Increase torrent priority +
* \*		: Toggle torrent's honors session limits flag +
* D		: Modify torrent download bandwidth limit +
* U		: Modify torrent upload bandwidth limit +
* d		: Modify global download bandwidth limit
* u		: Modify global upload bandwidth limit
* L		: Set seed ratio of torrent +
* m		: Move torrent to another directory +
* R, Shift+Del	: Remove torrent and delete its data

An action marked with + acts on:
* Viewed torrent in details mode
* Selected torrents in list mode
* Focused torrent in list mode if no torrents are selected

#### Torrent details mode keys
* Esc	: Unfocus file if a file is focused, otherwise return to torrents list mode
* q, Backspace	: Return to torrents list mode
* Enter	: View file
* J		: Move to next directory in file list
* K		: Move to previous directory in file list
* Space	: Select/unselect file and move to next file
* a		: In files tab: select/unselect all files. In trackers tab: add a tracker to torrent
* A		: Select/unselect all files in directory
* V		: Visually select files
* ,		: Select files matching text
* <		: Select files matching regular expression
* i		: Invert selection
* r, Del	: Remove tracker
* Tab	: Move to next tab
* Shift-Tab	: Move to previous tab
* Right,l	: Increase priority of focused or selected files. Move to next tab if no file is selected or focused.
* Left,h	: Decrease priority of focused or selected files. Move to previous tab if no file is selected or focused.
* o		: Move to overview tab
* f		: Move to files tab
* e		: Move to peers tab
* t		: Move to trackers tab
* c		: Move to chunks tab
* /		: Search for files matching pattern
* .		: Search for files matching regular expression
* s		: File sort menu

#### Torrents list mode keys
* q		: Quit `tremc`
* Esc	: Unfocus torrent
* Enter, Right, l	: Enter torrent details mode for current torrent
* o		: Options dialog
* Space : Select/unselect torrent and move to next torrent
* A		: Select/unselect all torrents
* ,		: Select torrents matching text
* <		: Select torrents matching regular expression
* i		: Invert selection
* s		: Torrent sort order menu
* f		: Torrent filter menu
* T		: Add torrent filter
* I		: Edit torrent filters
* ~		: Invert filters action
* t		: Toggle turtle mode
* J		: Move torrent down in queue
* K		: Move torrent up in queue
* r, Del	: Remove torrent, keeping data
* ^r	: Remove selected torrents, keeping data
* e		: Profile selection menu
* C		: Change betweem 1,2,3 lines per torrent modes
* a		: Add torrent dialog
* ^a	: Add torrent (in paused mode) dialog
* /		: Search for torrents matching pattern
* .		: Search for torrents matching regular expression

## Configuration file
By default the configuration file is called settings.cfg in the XDG configuration directory for `tremc`. With default XDG configuration, this will be `~/.config/tremc/settings.cfg`.

The configuration file is in .ini format (section names in square brackets, key = value, comments start with # or ;).

The following sections are read:
* [Connection] : keys are username, password, host, port, path, ssl (boolean).
* [Sorting] : The key 'order' determines torrents sort order. Possible values are: name, addedDate, percentDone, seeders, leechers, sizeWhenDone, status, uploadedEver, rateUpload, rateDownload, uploadRatio, peersConnected, downloadDir, mainTrackerDomain.
* [Filtering] : Keys are invert (boolean) and filter with possible values: uploading, downloading, active, paused, seeding, incomplete, verifying, private, isolated, tracker, regex, location, selected, honors, label. The filters tracker, regex, location, label need a parameter, so cannot be set in this way.
* [Misc] : Keys are
  * lines_per_torrent, value between 1 and 3.
  * torrentname_is_progressbar (boolean)
  * file_viewer, name of program to run for viewing a file. The string %%s is replaced by the file name.
  * file_open_in_terminal (boolean)
  * rdns (boolean), the value True enables showing the reverse DNS of connected peers.
  * geoip2_database - The location of the Python-GeoIP2 database file. If this key does not exist, or does not point to a file, the database is also searched for in some commonly used locations.
* [Colors]
* [Profiles]


## Calling transmission-remote

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

Halfwits Personal Dotfiles
#[Wmutils](https://github.com/wmutils)
(I use a slightly modified set of scripts from those available in the contrib repo) 
I wanted my windows to lay out a very specific way - and that ended up as a [2D bin-packing algorithm](https://github.com/halfwit/binpack), while allowing some give on the size of any particular window. These are all outlined in [cfg/wmutils/wshuf](https://github.com/halfwit/dotfiles/blob/master/share/x11/wshuf)

This all allows me to do the following:
 - strict character for terminal applications
 - variable widths for browsers and editors
 - best-fit of a set of open windows

This is why I do all of this - [cognitive penalties are too severe to be effective on a computer](http://www.wired.com/2010/05/ff_nicholas_carr/). I have trouble retaining information, and was able to corellate that to distractions. This end result is my attemp to reduce all of that, thus becoming more useful in my day-to-day.

###Group management
I've written a group management set of binaries to go along with wmutils, which allow me to set an arbitrary group name as an x11 atom on a window. An additional binary allows me to list all windows that contain that same arbitrary group name - the rest is glued together with tools from wmutils, and script.

##This is how it all looks 
[![wmutils and bin packing demo](http://img.youtube.com/vi/MSIjqTgtj2c/0.jpg)](https://www.youtube.com/watch?v=MSIjqTgtj2c)

#[Dsearch](https://github.com/halfwit/dotfiles/blob/master/bin/dsearch)
This is a dmenu/bemenu based set of scripts for various search-oriented actions, using a set of [handlers](https://github.com/halfwit/dotfiles/blob/master/share/dsearch).

Each handler is invoked using the traditional DuckDuckGo handler behavior, !foo bar baz. (Anything not matching a handler is simply passed through, to DuckDuckGo)

In addition, bookmarks are handled in dsearch, as I found myself switching browser too frequently [demo](https://ptpb.pw/qR19.mkv), and currently session management as tabbed causes too many issues. [demo](https://ptpb.pw/SyC3.mkv)

Notable handlers include:
 - [youtube search](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/yt) (You do need a developer API key)
 - Gmusicapi integration [Song search/list](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/song) [Album search/list](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/album) [Station search/list](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/listen)
 - [Manual search](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/man)
 - [Code](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/code) Search for code snippets on local system
 - [Save](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/save) This isn't really search oriented, and will eventually move to a better default. This script was written so that I wouldn't have to go through various repetitive steps to save a link, be it an image, a video, or a bookmark. [photo saving](https://ptpb.pw/LMBL.mkv) [bookmark saving](https://ptpb.pw/qR19.mkv)
 - [Notes](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/notes) Search for and create notes
 - [Todo](https://github.com/halfwit/dotfiles/blob/master/share/dsearch/todo) Search for and manage my various todo lists

#[Plumber](https://github.com/halfwit/dotfiles/blob/master/bin/plumber)
 Based on [Plan9's ipc mechanism of the same name](http://plan9.bell-labs.com/sys/doc/plumb.html), this is merely a script to act on an arbitrary string of input in a meaningful way. If the string is a path or URL, it will attempt to infer the mimetype, and finally open it with the correct application. If the string does not match either of those cases, it runs through and attemps to open a manual entry for the string.

#[Unification](https://github.com/halfwit/dotfiles/blob/master/bin/unification)
 Heavily inspired by Shougo's [unite.vim](https://github.com/Shougo/unite.vim), this is a barebones path search, which will run the resulting file through the plumber utility.

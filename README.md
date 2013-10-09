# Keyboard Toolbar Remover Cordova Plugin 

The keyboard in an iOS web view has an InputAccessoryView with Previous, Next and Done buttons.

![with_toolbar](https://github.com/don/KeyboardToolbarRemover/raw/master/with_toolbar.png)

This plugin allows the toolbar to be hidden.

![toolbar_removed](https://github.com/don/KeyboardToolbarRemover/raw/master/toolbar_removed.png)

# Installation

Assuming you're running Cordova 2.9+ and using the command line interface

    $ cd /path/to/project
    $ cordova plugin add https://github.com/don/KeyboardToolbarRemover

# Usage

The plugin creates a global variable called `toolbar` when it is installed.

To disable the toolbar 

	toolbar.hide()

To re-enable the toolbar

	toolbar.show()

# Credit

The code to hide the toolbar is based on the [Josh Garnham](http://twitter.com/jgarnham)'s code in a [blog post](http://ios-blog.co.uk/tutorials/rich-text-editing-a-simple-start-part-1/). (Scroll down to the Bonus Code section.)

# License

The MIT License

Copyright (c) 2012-3 Chariot Solutions

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


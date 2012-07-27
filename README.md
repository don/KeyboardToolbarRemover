# Keyboard Toolbar Remover Cordova Plugin 

The keyboard in an iOS web view has an InputAccessoryView with Previous, Next and Done buttons.

![with_toolbar](https://github.com/don/cordova-plugin-keyboard_toolbar_remover/raw/master/with_toolbar.png)

This plugin allows the toolbar to be hidden.

![toolbar_removed](https://github.com/don/cordova-plugin-keyboard_toolbar_remover/raw/master/toolbar_removed.png)

# Usage

## HTML

Include the Javascript after cordova.js and before your application's javascript file

	<script type="text/javascript" src="keyboard_toolbar_remover.js"></script>
	
In your Javascript, include the module

	var toolbar = cordova.require('cordova/plugin/keyboard_toolbar_remover');
	
To disable the toolbar 

	toolbar.hide()

To re-enable the toolbar
	
	toolbar.show()
	
# Installation

## Manual Installation

Copy KeyboardToolbarRemover.h and KeyboardToolbarRemover.m to the Plugins directory of your iOS project.

Copy keyboard_toolbar_remover.js to the www directory of your project.

Edit Cordova.plist.  Add an entry under the plugin section mapping KeyboardToolbarRemover to KeyboardToolbarRemover.

![cordova plist](https://github.com/don/cordova-plugin-keyboard_toolbar_remover/raw/master/cordova.plist.jpg)


## pluginstall

The [pluginstall](https://github.com/alunny/pluginstall) tool will automatically install Cordova plugins that confirm to the [cordova-plugin-spec](https://github.com/alunny/cordova-plugin-spec).

_back your project up before running pluginstall_

Install pluginstall using npm (requires Node.js)

	npm install -g pluginstall
	
Install the plugin

	pluginstall ios /path/to/project /path/to/plugin

# Credit

The code to hide the toolbar is based on the [Josh Garnham](http://twitter.com/jgarnham)'s code in a [blog post](http://ios-blog.co.uk/tutorials/rich-text-editing-a-simple-start-part-1/). (Scroll down to the Bonus Code section.)

# License

The MIT License

Copyright (c) 2012 Chariot Solutions

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


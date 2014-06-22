**NOTE:** I recommend using the Cordova [Keyboard Plugin](https://github.com/apache/cordova-plugins/tree/master/keyboard)  instead of this one. The Cordova Keyboard Plugin has better support for resizing and works with Cordova 3.2+.

# Keyboard Toolbar Remover Cordova Plugin 

The keyboard in an iOS web view has an InputAccessoryView with Previous, Next and Done buttons. This plugin allows the toolbar to be hidden.

![with_toolbar](https://github.com/don/KeyboardToolbarRemover/raw/master/ios7_with_toolbar.png) &nbsp; ![toolbar_removed](https://github.com/don/KeyboardToolbarRemover/raw/master/ios7_toolbar_removed.png)

![with_toolbar](https://github.com/don/KeyboardToolbarRemover/raw/master/with_toolbar.png) &nbsp; ![toolbar_removed](https://github.com/don/KeyboardToolbarRemover/raw/master/toolbar_removed.png)

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
	
## Troubleshooting

If you see a bar above the keyboard with iOS7, try adding `height=device-height` to the viewport meta tag. See [Issue 9](https://github.com/don/KeyboardToolbarRemover/issues/9) for more details.

# Credits

The original code to hide the toolbar is based on the [Josh Garnham](http://twitter.com/jgarnham)'s code in a [blog post](http://ios-blog.co.uk/tutorials/rich-text-editing-a-simple-start-part-1/). (Scroll down to the Bonus Code section.)

[Steve Smith](https://github.com/stevenpsmith)'s iOS 7 fix was influenced by [a stack overflow post](http://stackoverflow.com/questions/18837551/remove-keyboard-form-toolbar-on-ios7-leaves-a-blur-behind/19042392#19042392).

[Michael Scholz](https://github.com/MichaelRando) and [Shinichi Hosokawa](https://github.com/shosokawa) provided patches for Cordova 3.0 compatibility.

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


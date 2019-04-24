# Mysthea Compendium

This repository contains the code of the official Mysthea compendium app.

The application is available on Google Play and on the Apple App Store.

<a href='https://play.google.com/store/apps/details?id=it.evonove.mysthea'><img width=160px alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png'/></a>
<a href="https://itunes.apple.com/us/app/mysthea/id1335553961?mt=8" style="display:inline-block;margin:11px;overflow:hidden;width:135px;height:40px;"><img src="https://linkmaker.itunes.apple.com/en-us/badge-lrg.svg?releaseDate=2019-01-30&kind=iossoftware&bubble=ios_apps"/></a>

# Supported Platforms

The app has been tested on the following platforms:

* Linux (Ubuntu 17.04)
* Mac OS X Sierra
* Android 5.0 and above
* iOS 9 and above

It might work on others too but it's not guaranted.

# Building

Qt 5.12 is the minimum version required to compile the project.

You can easily compile the whole project by opening `mysthea-app.pro` in Qt Creator, alternatively you can compile from command line.

To run on Linux or Mac OS X use:

    <path_to_qt_5.12>/qmake CONFIG+=no-tests <path_to_mystha_project>/mysthea-app.pro && make

If you want to compile tests remove `CONFIG+=no-tests` from the commands.


There are lots of images included in the final binary so it might take a while to finish.

# Known issues

After compiling the project for iOS it might be necessary to change the `CFBundleIdentifier` to `it.evonove.mysthea` directly in XCode or it might not be deployed correctly.

# License

The project is licensed under the MIT License. For more info see the [LICENSE](./LICENSE) file.

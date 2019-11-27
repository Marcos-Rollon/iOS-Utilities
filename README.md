### iOS Utilities

#### What is this?
This repo contains most of the utilities, extensions and functions of general proupose that I use to be productive in Swift. Most of these are production-tested and I have personally used like 90% then in App Store apps.

#### Did you make all of this?
Althrought I have written most of the code here, I have also taken some form other open source projects. Every snippet of code has their original credentials, but I want to mention two repos in particular:

<a href="https://github.com/SwifterSwift/SwifterSwift">Swifter Swift</a>, wich is a similar concept to this repo, and I have pick some extensions from there. Is a really good work but I preffer to have a bit more control, and I find myself not needing as many extensions as they have, so thats why I made this.

<a href="https://github.com/melvitax/DateHelper">Date Helper</a> by melvitax, wich is an awesome tool to work with the Date type and I have included it here completly. Is awesome and **you should go and leave a star there.**

Feel free to look throught the code, is mostly docummented and self explanatory. I also have a ***table of contents***

#### I have this [method/extension/utilitie], you should add it!
If you find yourself doing something that fits this three requirements : *** it's repetitive, boring and error prone* **(Thanks <a href="https://www.swiftbysundell.com/articles/using-child-view-controllers-as-plugins-in-swift/">John Sundell</a>) summit a pull request and I will probably add it here.
**Remember, we are here to help each other!**


#### Table of contents
[Extensions](#Extensions)
<br>
[Utlils](#Utils)
<br>
[Layout](#Layout)

#### Extensions
All the extension code is self documented, it consits mostly in really small utility methods. Maybe the most interesting is the "UIView" extensions, wich are mostly to do UI programatically. Spetial mention to * DateHelper* wich was made by <a href="https://github.com/melvitax/DateHelper">melvitax</a>, and you can find all the docs in his repo

#### Utils

Other that some ID and Alert creation, the most interesting file here is the one called *FormatDisplay* . I took the idea from an article I read long ago (sorry I can't remember the name) to use an struct full of static methods to format my data to be cosumed by the UI. I have work in a lot of apps that use a lot of physics data, like running apps. In those apps, we use to use the <a href="https://simple.wikipedia.org/wiki/International_System_of_Units">SI</a> to save all our data in the backend, but normally the UX/UI will ask for that data to be displayed in a variety of ways, mostly in String form (to be used by labels, for example). Thats why this struct exits. I has methods for dates and numbers to be comberted in formated strings in an easy and painless way. 

For example, lets say you are calculating the distance of a route from the gps data. It will probably be in meters, but a distance of "13465" is not ideal to be shown in the UI, so you just need to:

```
let distance : Double = 13465
let formattedDistance = FormatDisplay.distanceToKm(distance)
// formattedDistance is now "13.47 km"
```
#### Layout

This part of the readme is in progress


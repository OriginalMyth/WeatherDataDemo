# WeatherDataDemo

Was built with Xcode 9.2
Using Swift 3.2


Libraries included (not all used)

RxSwift
Alamofire
RealmSwift
SwiftCharts

Requires Cocoapods 1.0.0 +


Notes 

Data is not persisted between sessions. 
Some form of data persistence would be required for the app. 
Both CoreData and Realm where considered but didn’t have time to implement.


Improvements

Improved error handling
Unit tests and UITesting
Share -> Needs share image and logic to make it safer
Also share button could be added to other screens to select what data to send.

Notes on Implementation
The first screen shows an overview of the data from the most recent year.
A tableview would have been suffice but a collection view offers more flexibility and therefore offers more scope in the future. Therefore a  collection view was chosen over a tableview

To export the csv file press the share button on the home view. It works best from actual device where can email it.

Sketch   A mock-up is included in Storyboard and can be seen on running the app. I tend to do my sketching with pencil and paper and then storyboard so decided to include the storyboard as the best way to show the mock-up.

The app has been built with SwiftCharts 
https://github.com/i-schuetz/SwiftCharts

However, another alternative is charts:
https://github.com/danielgindi/Charts

The images used to mock the possible views are taken from this. 

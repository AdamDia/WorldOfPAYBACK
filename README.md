
# WorldOfPAYBACK

The application has two main screens. The first screen is a list view that displays transactions loaded from a local JSON file, with a navigation toolbar that contains a button and a label displaying the sum of all the transactions. The button opens a filter sheet that allows the user to filter the current transactions by category. The second screen is a details view that is displayed when the user taps on a specific transaction row in the list view. This screen provides more information about the selected transaction.

## WireFrame

<img width="1177" alt="WorldOfPAYBACK_Sketch" src="https://user-images.githubusercontent.com/50494822/214643784-fba22211-8508-43c3-a38e-a348d7b6fadd.png">


## Tech Specifications

- I have used mainly MVVM architecture pattern with a coordinator which is decoupling and managing the navigation logic apart from the rest of the app.
- Also Created XIB file for transaction Details screen I thought it would be greate to have a mix between UIKit and SwiftUI as you mentioned in the project note that you are moving from UIKit to SwiftUI.
- Covered network delays and randomly fails as you mentioned.
- Unit Test for Network layer and view model.
- Custom Errors and custom alert.
## Tech Stack

**Client:** MVVM-C architecture pattern, , Combine, UIKit, SwiftUI



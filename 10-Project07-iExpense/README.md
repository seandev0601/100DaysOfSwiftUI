# **Project 7 - iExpense**

In this project we’re going to build iExpense, which is an expense tracker that separates personal costs from business costs. At its core this is an app with a form (how much did you spend?) and a list (here are the amounts you spent), but in order to accomplish those two things you’re going to need to learn how to:

    - Present and dismiss a second screen of data.
    - Delete rows from a list
    - Save and load user data
  
  

- [Part 1](https://www.hackingwithswift.com/100/swiftui/36)
- [Part 2](https://www.hackingwithswift.com/100/swiftui/37)
- [Part 3](https://www.hackingwithswift.com/100/swiftui/38)


## **Learn**


- Day 36 
    - @StateObject
        - @Published
        - ObservableObject
    - Sheet
        - @Environment(.dismiss)
    - List **onDelete()**
        - EditButton
    - UserDefault
        - @AppStorage
    - Codable
        - JSONEncoder()
        - JSONDecoder()
        
- Day 37
    - @ObservableObject
    - Identifiable 、 UUID
    - JSONEncoder()
    - JSONDecoder()
    - UserDefaults
    
- Day 38 Challenge
    1. Use the user’s **preferred currency**, rather than always using US dollars.
    2. Modify the expense **amounts** in **`ContentView`** to contain some styling depending on their value – expenses **under $10** should have one **style**, expenses **under $100** another, and expenses **over $100** a third style. What those styles are depend on you.
    3. For a bigger challenge, try **splitting the expenses list** into **two sections**: **one** for **personal** expenses, and **one** for **business** expenses. This is tricky for a few reasons, not least because it means being careful about how items are deleted!
    
## **My Note**

- [Day 36](https://hsiangdev.notion.site/Day-36-Project-7-Part-1-iExpense-100DaysOfSwiftUI-e2b46536566f415a8af6c88dc1e49c69?pvs=4)
- [Day 37](https://hsiangdev.notion.site/Day-37-Project-7-Part-2-iExpense-100DaysOfSwiftUI-e6b60f346c6a41c4b06cbb1d1b22c334?pvs=4)
- [Day 38](https://hsiangdev.notion.site/Day-38-Project-7-Part-3-Challenge-100DaysOfSwiftUI-cbaa3bf0e589473c85ff03b4604ef8de?pvs=4)


## Screenshots

- Day 37

<div>
    <img src="Screenshots/day37-iExpense-1.png" width="250">
    <img src="Screenshots/day37-iExpense-2.png" width="250">
</div>

- Day 38

<div>
    <img src="Screenshots/day38-challenge-1.png" width="250">
</div>

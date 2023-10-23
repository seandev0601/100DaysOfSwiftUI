# Challenge - MemorySnap

- [Part 1](https://www.hackingwithswift.com/100/swiftui/77)

## **Learn**

- Day 77 Challenge
  
Your goal is to build an app that **asks users to import a picture** **from** their **photo library**, then **attach a name** to whatever they imported. The **full collection of pictures** they **name** should be **shown** in a **`List`**, and **tapping an item** in the list should **show** a **detail screen** with a **larger version of the picture**.

Breaking it down, you should:

- Wrap **`PHPickerViewController`** so it can be used to **select photos**.
- **Detect** when a **new photo is imported**, and **immediately ask the user to name the photo**.
- **Save that name and photo** somewhere safe.
- **Show all names and photos in a list**, **sorted** by **name**.
- **Create** a **detail** screen that **shows a picture full size**. 
- **Decide** on a way to **save all this data**.

    - PHPickerViewController
    - JSONEncoder、JSONDecoder
    - documentDirectory
    - jpegData(compressionQuality:)
    - MVVM
    
## **My Note**

- [Day 77](https://hsiangdev.notion.site/Day-77-Milestone-Projects-13-15-Challenge-MemorySnap-100DaysOfSwiftUI-984364e341b241089a768e67534019a4?pvs=4)

## Screenshots

- Day 77

<div>
    <img src="Screenshots/day77-MemorySnap-1.png" width="250">
    <img src="Screenshots/day77-MemorySnap-2.png" width="250">
    <img src="Screenshots/day77-MemorySnap-3.png" width="250">
    <img src="Screenshots/day77-MemorySnap-4.png" width="250">
</div>

  

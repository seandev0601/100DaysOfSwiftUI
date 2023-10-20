# Project 15 - Accessibility Sandbox

- [Part 1](https://www.hackingwithswift.com/100/swiftui/74)
- [Part 2](https://www.hackingwithswift.com/100/swiftui/75)
- [Challenge](https://www.hackingwithswift.com/100/swiftui/76)

## **Learn**

- Day 74 
    - accessisbilityLabel()
    - accessibilityAddTraits()
    - accessibilityRemoveTraits()
    - Image(decorative:)
    - accessibilityHidden()
    - accessibilityElement(children:)
    - accessibilityAdjustableAction()
  
- Day 75
    - Fixing [Guess the Flag](https://github.com/seandev0601/100DaysOfSwiftUI/tree/main/03-Project02-GuessTheFlag)
        - accessibilityLabel()
    - Fixing [Word Scramble](https://github.com/seandev0601/100DaysOfSwiftUI/tree/main/07-Project05-WordScramble)
        - accessibilityElement(children:)
        - accessibilityHint()
    - Fixing [Bookworm](https://github.com/seandev0601/100DaysOfSwiftUI/tree/main/15-Project11-Bookworm)
        - accessibilityAddTraits()
        - accessibilityElement()
        - accessibilityValue()
        - accessibilityAdjustableAction()
  
  
- Day 76 Challenge
    1. The check out view in [**Cupcake Corner**](https://github.com/seandev0601/100DaysOfSwiftUI/tree/main/14-Project10-CupcakeCorner) uses an **image** and **loading spinner** that don’t add anything to the UI, so find a way to **make** the **screenreader** not read them out.
        - .accessibilityHidden(true)

    2. Fix the **list rows** in [**iExpense**](https://github.com/seandev0601/100DaysOfSwiftUI/tree/main/14-Project10-CupcakeCorner) so they **read** out the **name** and **value** in **one single VoiceOver label**, and **their type in a hint**.
        - .accessibilityElement(children: .ignore)
        - .accessibilityLabel()
        - .accessibilityHint()

    3. Do a **full** **accessibility review of [Moonshot](https://github.com/seandev0601/100DaysOfSwiftUI/tree/main/11-Project08-Moonshot)** – what changes do you need to make so that it’s fully accessible?
        - .accessibilityElement(children: .ignore)
        - .accessibilityLabel()
        - .accessibilityHint()
        - .accessibilityElement(children: .combine)
        - .accessibilityAddTraits(.isButton)
    
    
## **My Note**

- [Day 74](https://hsiangdev.notion.site/Day-74-Project-15-Part-1-AccessibilitySandbox-100DaysOfSwiftUI-1b01c316c93b4aa5ab7f9a69e9e82730?pvs=4)
- [Day 75](https://hsiangdev.notion.site/Day-75-Project-15-Part2-Accessibility-Sandbox-100DaysOfSwiftUI-946ba1a6cc42475b91259ac48e2bd452?pvs=4)
- [Day 76](https://hsiangdev.notion.site/Day-76-Project-15-Accessibility-Sandbox-Challenge-100DaysOfSwiftUI-a7c6db79538a48b2a62d4040169b8265?pvs=4)

## Screenshots

- Day 74

<div>
    <img src="Screenshots/day74-Accessibility-1.png" width="250">
    <img src="Screenshots/day74-Accessibility-2.png" width="250">
    <img src="Screenshots/day74-Accessibility-3.png" width="250">
    <img src="Screenshots/day74-Accessibility-4.png" width="250">
</div>

  

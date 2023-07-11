# **Day 19 Challenge - Unit Conversions**

You need to build an app that handles unit conversions: users will select an input unit and an output unit, then enter a value, and see the output of the conversion.

## Topic

- Temperature conversion: users choose Celsius, Fahrenheit, or Kelvin.
- Length conversion: users choose meters, kilometers, feet, yards, or miles.
- Time conversion: users choose seconds, minutes, hours, or days.
- Volume conversion: users choose milliliters, liters, cups, pints, or gallons.

If you were going for **length conversion** you might have:
- A **segmented control** for meters, kilometers, feet, yard, or miles, **for** the **input unit**.
- A **second segmented** **control** for meters, kilometers, feet, yard, or miles, **for** the **output unit**.
- A **text field** where users **enter** a **number**.
- A **text** view **showing** the result of the **conversion**.

## Tips

1. First, and most importantly: **keep it simple**!
2. Second, a better idea is to **convert** the **user’s input** to a single **base unit**, then **convert** from there to the **target unit**.
3. Third, as we have **three user values** here – **their input number**, their **input unit**, and **their output unit**.
    - You need to have **three** **`@State`** properties to store them all
    - **one** **`TextField`**
    - **two** **pickers**
    - **one** **text** view to show your output
4. You can break your form up into sections if you want, but it’s not required.


## **My Note**

- [Day 19](https://hsiangdev.notion.site/Day-19-Challenge-day-100DaysOfSwiftUI-a34b22eec8a64231803e622883567153?pvs=4)

## Screenshots

<div>
    <img src="Screenshots/Day18-timeconversion_1.png" width="250">
    <img src="Screenshots/Day18-timeconversion_2.png" width="250">
</div>

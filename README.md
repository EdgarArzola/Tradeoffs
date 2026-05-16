# Tradeoffs

A small SwiftUI app built around the classic project management triangle: **Good**, **Fast**, **Cheap** — pick any two.

## Overview

Three overlapping circles represent the three options. Tap a circle to select it; tap again to deselect. You can have at most two selected at a time — choosing a third automatically deselects the option you picked first.

Once two are selected, the app tells you the tradeoff:

- **Good + Cheap** → Will be slow
- **Fast + Good** → Will be expensive
- **Cheap + Fast** → Will be low quality

## Demo

https://github.com/user-attachments/assets/877088e5-9df0-4d86-b805-faab3447cb53

## Structure

- `TradeoffsApp.swift` — app entry point
- `MainView.swift` — the circle UI and selection interactions
- `TradeoffsViewModel.swift` — selection state and the business rules
- `Styles.swift` — shared styling constants

## Requirements

- iOS 26+ (uses the new `.glassEffect` modifier)
- Xcode 26+

# R-P-S (Rock-Paper-Scissors)

Created by Parth Antala on 2024-07-06

## Overview
R-P-S is a simple iOS game built using SwiftUI where users can play the classic game of Rock-Paper-Scissors against the computer. The app dynamically displays the computer's choice and determines the result based on the user's selection.

## Features
- Interactive gameplay of Rock-Paper-Scissors.
- Animated display of computer's choice.
- Real-time result feedback based on user input.
- Start and reset functionality for repeated gameplay.

## Screenshots
Include some screenshots here to give a visual overview of the app.

## Getting Started

### Prerequisites
- Xcode 12 or later
- iOS 14 or later

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/r-p-s.git
    ```
2. Open the project in Xcode:
    ```bash
    cd r-p-s && open RPS.xcodeproj
    ```
3. Build and run the project on your preferred simulator or device.

## Usage
1. Launch the app to start playing Rock-Paper-Scissors.
2. Tap on one of the buttons (ROCK, PAPER, or SCISSOR) to make your move.
3. View the animated display of the computer's choice.
4. See the result (WINNER, LOSER, or IT'S A DRAW) displayed based on your selection.

## Code Overview

### Main Components
- `ContentView.swift`: The main view of the app, handling the user interface and game logic.
- `Movement`: An enum representing the three possible moves (Rock, Paper, Scissors).
- `Result`: An enum representing the possible game outcomes (Win, Loss, Draw).

### Key Functions
- `checkResult(random: Movement, user: Movement)`: Determines the game result based on the computer's and user's choices.
- `ButtonViewModifier`: A custom view modifier for styling buttons.


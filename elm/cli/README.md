# Elm Algorithm Template

A template project for implementing algorithms in Elm with JavaScript integration. This template handles all the boilerplate code for JSON input/output, allowing you to focus solely on algorithm implementation.

## Project Structure

```
.
├── src/
│   ├── Main.elm      # Core application logic (don't modify)
│   ├── Types.elm     # Input/Output type definitions
│   ├── Algorithm.elm # Algorithm implementation
│   └── main.ts       # TypeScript CLI interface
├── example/
│   └── input.json    # Example input file
├── compile.sh        # Build script
├── tsconfig.json     # TypeScript configuration
└── elm.json         # Elm configuration
```

## Prerequisites

- Node.js
- Elm 0.19.1
- VSCode

## Implementing a New Algorithm

1. Define your input/output types in `src/Types.elm`:

```
type alias Input = -- Your input type
type alias Output = -- Your output type

-- Define JSON encoders/decoders for your types
inputDecoder : D.Decoder Input
encodeOutput : Output -> E.Value
```

2. Implement your algorithm in `src/Algorithm.elm`:

```
module Algorithm exposing (algorithm)

import Types exposing (Input, Output)

algorithm : Input -> Output
algorithm input =
    -- Your implementation here
```

## VSCode/Cursor Integration

The project includes VSCode tasks for easy compilation and testing (see `.vscode/tasks.json`):

- **Compile**: `Ctrl/Cmd + Shift + B`
  - Compiles Elm code to JavaScript
  - Output files are placed in `dist/`
- **Run with example**: `Ctrl/Cmd + Shift + P → "Tasks: Run Test Task"`
  - Compiles the code
  - Runs the algorithm with `data/input.json`
  - Writes output to `data/output.json`
  - Displays the output in the terminal

## Example Usage

1. Create an input JSON file in `data/input.json`
2. Run the test task in VSCode/Cursor to see the output

For custom input/output files:

## Template Features

- Separation of Concerns:
  - `Main.elm`: Handles ports and program structure
  - `Types.elm`: Defines input/output types and JSON coding
  - `Algorithm.elm`: Contains only the algorithm implementation
  - `main.js`: CLI interface for file I/O
- JSON Integration: Automatic JSON parsing and generation
- CLI Interface: Easy file-based input/output
- Development Tools: VSCode tasks for quick compilation and testing

## Common Tasks

1. Creating a New Algorithm Project:

- Copy this template
- Update `Types.elm` with your input/output types
- Implement your algorithm in `Algorithm.elm`

2. Testing:

- Place test inputs in `data/input.json`
- Run the test task in VSCode
- Check output in `data/output.json`

## Notes

- The template uses `Platform.worker` in Elm, which means it runs without a GUI
- All file I/O is handled by the JavaScript side
- Error handling is included for invalid JSON input

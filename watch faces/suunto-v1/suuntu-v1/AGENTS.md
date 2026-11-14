# Suunto Inspired Watch

Inspired by the Suunto 2 model. See the original photo in the resources directory: [Suunto_Run2.png](resources/drawables/Suunto_Run2.png).

# Agent Instructions

1. Every Session start, scan the Suunto_Run2 image so the reference will be saved in your session knowledge.
2. Every Session start, read the PLAN.MD file attached, present to the user what phase was completed last and confirm we are still working on the current (unchecked).

## Syntax and Build instructions
1. When unsure how to use Monkey C, consult Context7 and the official Connect IQ documentation.
2. Do not compile the app unless the user explicitly asks. The project-local VS Code task `Connect IQ: Build fenix9pro51mm simulator` reads the SDK location from `.vscode/connectiq.local.env` and runs `.vscode/build.ps1`. If the simulator is not already running, notify the user to start it manually the first time. After a successful build, tell the user to click VS Code's Restart button to re-render the face in the simulator. The local env file is ignored by `.gitignore`; do not commit it.

## Logic Layer Instructions

## UI Layer instructions

3. Use `resources/layouts/layout.xml` for simple, static UI layout: labels and drawables, their positions, fonts, justification, and fixed colors. Prefer anchors such as `center` and percentages for positions that should scale across displays. Layout XML does not support arbitrary calculations or expressions; keep dynamic values and behavior in Monkey C, but avoid drawing simple static UI directly in code.

4. Whenever changing UI elements, compare the result with the Suunto Run2 reference and re-scan the affected layout for possible conflicts. Check rendered bounds using font size and metrics, justification, and target screen dimensions; do not rely on anchor coordinates alone. Try to resolve conflicts yourself in the way that best matches the reference. If you make a resolution, tell the developer explicitly, for example: "NOTE: X and Y conflicted; I resolved it by doing Z." If you cannot confidently choose a resolution, explain the conflict and ask the developer for direction before making a tradeoff.

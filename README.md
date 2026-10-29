# Reminders - SwiftUI App

A SwiftUI recreation of the iOS Reminders application, built for iOS Bootcamp Meeting 3.

## 📱 Preview
A clean, interactive todo list app allowing users to organize tasks, change list themes, and manage completion states.

<img width="331" height="681" alt="reminders-ui" src="https://github.com/user-attachments/assets/26fa3d37-4a6a-4fb4-b79a-1b6c117b1eec" />


## 🛠 Features
- **State Management (`@State` & `@Binding`)**: Leveraged `@State` as the single source of truth for list items and theme settings, passing two-way `@Binding` references to subviews for real-time updates.
- **Code Modularity & Subviews**: Structured into clean, reusable component views (`EditSheet`, `ColorChooser`, and `ReminderRow`).
- **Interactive Editing**: Inline text editing via `TextField`, task completion toggles, custom list title customization, and swipe-to-delete `.onDelete` list support.
- **Custom Color Picker**: Built dynamic theme color selection powered by `LazyVGrid` and custom selection overlays.
- **Dynamic List Iteration**: Utilized `ForEach` with two-way binding projections (`$page.items`) to render and update models conforming to `Identifiable`.

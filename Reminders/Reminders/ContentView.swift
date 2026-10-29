import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var newReminderTitle: String = ""
    @State private var page: RemindersPage = RemindersPage(
        title: "Today's Tasks",
        items: [
            Reminder(title: "Complete iOS Bootcamp Project", isCompleted: false),
            Reminder(title: "Review @State and @Binding concepts", isCompleted: true)
        ],
        color: .blue
    )
    
    var body: some View {
        VStack {
            // Header View
            HStack {
                Text(page.title)
                    .font(.system(size: 34))
                    .bold()
                    .foregroundStyle(page.color)
                
                Spacer()
                
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title)
                        .foregroundStyle(page.color)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            // Reminders List
            List {
                ForEach($page.items) { $reminder in
                    ReminderRow(reminder: $reminder, themeColor: page.color)
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // Footer View
            HStack {
                Button {
                    let newReminder = Reminder(title: "New Reminder")
                    page.items.append(newReminder)
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                            .bold()
                    }
                    .font(.title3)
                    .foregroundStyle(page.color)
                }
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $isEditing) {
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
    }
}

// Subview for Individual Reminder Item
struct ReminderRow: View {
    @Binding var reminder: Reminder
    var themeColor: Color
    
    var body: some View {
        HStack {
            Button {
                reminder.isCompleted.toggle()
            } label: {
                Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(reminder.isCompleted ? themeColor : .gray)
            }
            .buttonStyle(.plain)
            
            TextField("Reminder title", text: $reminder.title)
                .foregroundStyle(reminder.isCompleted ? .gray : .primary)
        }
    }
}

#Preview {
    ContentView()
}

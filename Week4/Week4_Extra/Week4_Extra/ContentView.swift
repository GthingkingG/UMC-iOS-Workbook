//
//  ContentView.swift
//  Week4_Extra
//
//  Created by Air on 6/19/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Task.createdAt, order: .reverse) private var tasks: [Task]
    @State private var newTaksTitle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("할 일 입력", text: $newTaksTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("추가") {
                        addTask()
                    }
                    .disabled(newTaksTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Button {
                                toggleDone(task)
                            } label: {
                                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(task.isDone ? .green : .gray)
                                    .imageScale(.large)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(task.title)
                                    .strikethrough(task.isDone)
                                Text(task.createdAt.formatted(date: .numeric, time: .shortened))
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("할 일 목록")
        }
    }
    
    private func addTask() {
        let trimmed = newTaksTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        let task = Task(title: trimmed)
        context.insert(task)
        try? context.save()
        newTaksTitle = ""
    }
    
    private func toggleDone(_ task: Task) {
        task.isDone.toggle()
        try? context.save()
    }
    
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            context.delete(tasks[index])
        }
        try? context.save()
    }
}

#Preview {
    ContentView()
}

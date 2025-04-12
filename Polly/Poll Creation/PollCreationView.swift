//
//  PollCreationView.swift
//  Polly
//
//  Created by Nikhil Dange on 12/04/25.
//

import SwiftUI

struct PollCreationView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var addOption: String = ""
    @State private var options: [String] = ["Yes", "No", "Ensure", "Rocket Science"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HeaderView(title: $title,
                           description: $description)
                Text("Add Options:")
                    .fontWeight(.semibold)
                AddOptionView(titleText: "") { title in
                    options.append(title)
                }
                OptionListView(options: $options)
            }
            .padding()
        }
        .navigationTitle("Create Poll")
        .toolbar {
            Button {} label: {
                Text("Done")
                    .fontWeight(.bold)
            }
        }
    }
}

// MARK: Modifier

private struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}

// MARK: Views

private struct OptionListView: View {
    @Binding var options: [String]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Existing Option:")
                .fontWeight(.semibold)
                .padding(.vertical)
            ForEach($options, id: \.self) { option in
                ShowEditOptionView(options: $options,
                               option: option)
            }
        }
    }
}

private struct HeaderView: View {
    @Binding var title: String
    @Binding var description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .fontWeight(.semibold)
            TextField("Enter poll title", text: $title)
                .modifier(TextModifier())
            Text("Description")
                .fontWeight(.semibold)
            TextField("Enter poll description", text: $description)
                .modifier(TextModifier())
        }
    }
}

private struct ShowEditOptionView: View {
    @Binding var options: [String]
    @Binding var option: String
    @State var isEditing = false
    var body: some View {
        HStack {
            if isEditing {
                AddOptionView(titleText: option) { title in
                    if let index = options.firstIndex(of: option) {
                        options[index] = title
                        isEditing.toggle()
                    }
                }
            } else {
                EditOptionView(titleText: option) { editState in
                    switch editState {
                    case .edit:
                        isEditing.toggle()
                    case .delete:
                        if let index = options.firstIndex(of: option) {
                            options.remove(at: index)
                        }
                    }
                }
            }
        }
        .modifier(TextModifier())
    }
}

private struct AddOptionView: View {
    @State var titleText: String
    var addText: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("Option Title", text: $titleText)
                .modifier(TextModifier())
            Button {
                if titleText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return }
                addText(titleText)
            } label: {
                Image(systemName: "plus.circle")
            }
        }
    }
}

private struct EditOptionView: View {
    enum EditingState {
        case edit
        case delete
    }
    
    @State var titleText: String
    var action: (EditingState) -> Void

    var body: some View {
        Text(titleText)
        Spacer()
        Button {
            action(.edit)
        }
        label: {
            Image(systemName: "pencil")
                .tint(.green)
        }
        Button {
            action(.delete)
        } label: {
            Image(systemName: "x.circle")
                .tint(.red)
        }
    }
}

// MARK: Preview

#Preview {
    NavigationStack {
        PollCreationView()
    }
}

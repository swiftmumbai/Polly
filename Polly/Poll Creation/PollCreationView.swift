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
                AddOptionView { title in
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
            }
        }
    }
}

private struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}

private struct AddOptionView: View {
    @State var titleText: String = ""
    var addText: (String) -> Void
    
    var body: some View {
        Text("Add Options:")
        HStack {
            TextField("Option Title", text: $titleText)
                .modifier(TextFieldModifier())
            Button {
                if titleText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return }
                addText(titleText)
            } label: {
                Image(systemName: "plus.circle")
            }
        }
    }
}

private struct OptionListView: View {
    @Binding var options: [String]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Existing Option:")
                .padding(.vertical)
            ForEach (options, id: \.self) { option in
                HStack {
                    Text(option)
                    Spacer()
                    Button {}
                    label: {
                        Image(systemName: "pencil")
                    }
                    Button {
                        if let index = options.firstIndex(of: option) {
                            options.remove(at: index)
                        }
                    } label: {
                        Image(systemName: "x.circle")
                    }
                }
                .padding(8)
                .background(Color.gray.opacity(0.05).cornerRadius(8))
            }
        }
    }
}

struct HeaderView: View {
    @Binding var title: String
    @Binding var description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
            TextField("Enter poll title", text: $title)
                .modifier(TextFieldModifier())
            Text("Description")
            TextField("Enter poll description", text: $description)
                .modifier(TextFieldModifier())
        }
    }
}

#Preview {
    NavigationStack {
        PollCreationView()
    }
}

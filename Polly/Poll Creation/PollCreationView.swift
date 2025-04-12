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
                VStack(alignment: .leading) {
                    Text("Title")
                    TextField("Enter poll title", text: $title)
                        .modifier(TextFieldModifier())
                    Text("Description")
                    TextField("Enter poll description", text: $description)
                        .modifier(TextFieldModifier())
                    Text("Add Options:")
                    HStack {
                        TextField("Option Title", text: $addOption)
                            .modifier(TextFieldModifier())
                        Button {
                            if addOption.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return }
                            options.append(addOption)
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("Existing Option:")
                        .padding(.vertical)
                        ForEach (options, id: \.self) { option in
                            HStack {
                                Text(option)
                                Spacer()
                                Button {
                                    
                                } label: {
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

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}


#Preview {
    NavigationStack {
        PollCreationView()
    }
}

//
//  ContentView.swift
//  Basic Example of SwiftUI Menu
//
//  Created by Михаил Куприянов on 7.9.23..
//

import SwiftUI

struct ContentView: View {
    var pickerOptions: [String] = ["Option 1", "Option 2", "Option 3"]
    @State var selectionOption = ""
    
    var body: some View {
        Menu {
            Button(action: { print("Button 1")}
            ) {
                Text("Button one")
            }
            Section("Header section two") {
                Button(role: .destructive, action: { print("Button 2 destructive")}
                ) {
                    Label("Delete", systemImage: "minus.circle")
                }
                Button(action: { print("Button 3 book")}
                ) {
                    Label("Book", systemImage: "book")
                }
                Menu {
                    Button(action: {
                        print("Submenu Button 3 book")
                        
                    }, label: {
                        Label("Submenu Book", systemImage: "figure.wave")
                        
                    })
                }label: {
                    Label("Submen", systemImage: "folder")
                }
            }
            Section("Header selection menu") {
                Button(action: { print("Button 4")}
                ) {
                    Text("Button four")
                }
                Picker("Option", selection: $selectionOption) {
                    ForEach(pickerOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                .onChange(of: selectionOption) {
                    print(selectionOption)
                }
            }
        } label: {
            Text("Menu")
        }
    }
}

#Preview {
    ContentView()
}

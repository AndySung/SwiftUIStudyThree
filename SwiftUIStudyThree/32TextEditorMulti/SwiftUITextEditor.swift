//
//  SwiftUITextEditor.swift
//  SwiftUIStudyThree
//
//  Created by andy on 2024/7/5.
//

import SwiftUI

struct SwiftUITextEditor: View {
    @State private var inputText = ""
    @State private var wordCount: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextEditor(text: $inputText)
                .font(.body)
                .padding()
                .padding(.top, 20)
                .onChange(of: inputText, perform: { newValue in
                    let words = inputText.split { $0 == " " || $0.isNewline }
                    self.wordCount = words.count
                })
            
            Text("\(wordCount) words")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.trailing)
        }
    }
}

struct TextFieldDemo: View {
    @State private var comment = ""
    
    var body: some View {
        TextField("Comment", text: $comment, prompt: Text("Please input your comment"), axis: .vertical)
            .padding()
            .background(.green.opacity(0.2))
            .cornerRadius(5.0)
            .padding()
            
    }
}

struct SwiftUITextEditor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextEditor()
    }
}

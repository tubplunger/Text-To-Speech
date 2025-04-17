//
//  ContentView.swift
//  texttospeech
//
//  Created by Gabriel Smith on 4/16/25.
//

import SwiftUI
import AVFoundation

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var inputText: String = ""
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack(spacing: 20) {
            Text("You typed:")
                .font(.headline)

            Text(inputText)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            TextField("Type something...", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .submitLabel(.done)

            Button("Speak") {
                speak(text: inputText)
                dismissKeyboard()
                inputText = "" // clear input
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            Spacer()
        }
        .padding()
    }

    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }

    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}

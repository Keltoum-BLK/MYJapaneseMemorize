//
//  WordPage.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 18/01/2023.
//
import AVFoundation
import SwiftUI

struct WordPage: View {
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    var word: FetchedResults<Word>.Element
    @Environment(\.dismiss) var dismiss
    
    let width : CGFloat = 300
    let height : CGFloat = 350
    let durationAndDelay : CGFloat = 0.3
    let synthesizer = AVSpeechSynthesizer()
    
    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Image("temple")
                .scaledToFit()
            ZStack {
                CardFront(width: width, height: height, textSize: 40,circleHeight: 100, circleWidth: 100, degree: $frontDegree, word: word)
                CardBack(width: width, height: height, textSize: 40, degree: $backDegree, word: word)
            }
            .onTapGesture {
                flipCard()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    let utterance = AVSpeechUtterance(string: "\(word.japanese ?? "")")
                    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
                    utterance.rate = 0.52
                    
                    self.synthesizer.speak(utterance)
                } label: {
                    Label("Add word", systemImage: "speaker.wave.2.fill")
                        .foregroundColor(.white)
                }
            }
        }
    }
    
}

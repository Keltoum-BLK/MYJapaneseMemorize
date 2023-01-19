//
//  Card.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 18/01/2023.
//

import SwiftUI

struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    let textSize: CGFloat
    let circleHeight: CGFloat
    let circleWidth: CGFloat
    
    @Binding var degree : Double
    var word: FetchedResults<Word>.Element

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Circle()
                .frame(width: circleWidth, height: circleHeight)
                .foregroundColor(.red.opacity(0.3))
            

            Text(word.french ?? "Parapluie")
                .bold()
                .font(.custom("Hashiba", size: textSize))
                .padding(.horizontal)
                .foregroundColor(.black)
                .scaledToFit()

        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    let textSize: CGFloat
    
    @Binding var degree : Double
    var word: FetchedResults<Word>.Element

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.red.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .padding()
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            VStack(spacing: 5){
                Spacer()
                Text(word.japanese ?? "かさ")
                    .bold()
                    .font(.custom("Hashiba", size: textSize))
                    .foregroundColor(.red)
                    .lineLimit(2)
            
                Text(word.romaji ?? "kasa")
                    .italic()
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .scaledToFit()
                
                Spacer() 
            }
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

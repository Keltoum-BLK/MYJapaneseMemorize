//
//  SplashAnimation.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 19/01/2023.
//
import Lottie
import SwiftUI

struct SplashAnimation: View {
    @State var show: Bool = false
    var body: some View {
        VStack {
            VStack {
                Text("Mon Carnet de Japonais")
                    .font(.custom("Hashiba", size: 40))
                    .foregroundColor(.black)
                Text("mon lexique de poche")
                    .italic()
                    .font(.custom("Hashiba", size: 20))
                    .foregroundColor(.black)
            }
            .frame(height: show ? nil : 0)
            .opacity(show ? 1 : 0)
            
            AnimatedView(show: $show)
                .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 3)
            VStack {
               
                    NavigationLink(destination: MainScreenView()) {
                        ZStack {
                            Color.white
                                .cornerRadius(40)
                            Text("Start")
                                .font(.custom("Hashiba", size: 30))
                                .foregroundColor(.black)
                        }
                        .frame(width: 150, height: show ? 50 : 0)
                        .opacity(show ? 1 : 0)
                        .shadow(radius: 10)
                    }
                }
        }
    }
}

struct SplashAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SplashAnimation()
    }
}

//Animation View
struct AnimatedView: UIViewRepresentable {
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let lottieAnimationView = LottieAnimationView(name: "japan.json", bundle: Bundle.main)
        let view = UIView(frame: .zero)
        
        lottieAnimationView.play { (status) in
            if status {
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                    show.toggle()
                }
            }
        }
        lottieAnimationView.animationSpeed = 4.0
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)
        
        NSLayoutConstraint.activate([
            lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("")
    }
}

//
//  ContentView.swift
//  iOS Example
//
//  Created by Ayoub on 5/9/2023.
//

import Foundation
import SwiftUI
import FancySliders


//struct SwiftUIxxPROJECTxNAMExx: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        return UIKitView()
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//    }
//}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
//            RatingSliderEx()
//
//            StepsSliderEx()
//
//            SwitchSliderEx()
            
            SliderToButtonEx()

        }
    }
}

struct RatingSliderEx: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Rating Slider example")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            RatingSlider (
                width: UIScreen.main.bounds.width - 32,
                height: 58,
                images: RatingImages(firstImage: "emoji-1", secondImage: "emoji-2", thirdImage: "emoji-3", fourthImage: "emoji-4", fifthImage: "emoji-5"),
                content: {
                    ZStack {
                        Capsule().fill(.yellow)
                        Text("Rate your experience!")
                            .foregroundColor(.white)
                    }
                },
                didRate: { value in
                    print("rate value: \(value)")
                }
            )
        }
    }
}

struct StepsSliderEx: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Slider with two steps")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            StepSlider(width: UIScreen.main.bounds.width - 32, height: 60, stepCount: 2) {
                Circle()
                    .fill(.white)
                    .padding(5)
                    .overlay {
                        Image(systemName: "trash.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .scaledToFit()
                            .frame(width: 25)
                    }
            } content: {
                Capsule().fill(Color.red.opacity(0.5))
            } didComplete: { value in
                print("step value: \(value)")
            }
            
            Spacer().frame(height: 10)
            
            Text("Slider with four steps")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            StepSlider(width: UIScreen.main.bounds.width - 32, height: 60, stepCount: 4) {
                Circle()
                    .fill(.white)
                    .padding(5)
                    .overlay {
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .foregroundColor(.black.opacity(0.8))
                            .scaledToFit()
                            .frame(width: 25)
                    }
            } content: {
                Capsule().fill(.gray.opacity(0.6))
            } didComplete: { value in
                print("step value: \(value)")
            }
        }
    }
}

struct SwitchSliderEx: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Switch Slider")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            
            SwitchSlider(width: UIScreen.main.bounds.width - 32, height: 80, title: "Switch On", titleColor: .white, colorOn: .green, colorOff: .red.opacity(0.8)) {
                Circle()
                    .fill(.white)
                    .padding(6)
                    .overlay {
                        Image(systemName: "power")
                            .resizable()
                            .foregroundColor(.black.opacity(0.8))
                            .scaledToFit()
                            .frame(width: 30)
                    }
            } didComplete: { value in
                print("Switch value: \(value)")
            }
            
            SwitchSlider(width: UIScreen.main.bounds.width - 32, height: 80, title: "Switch On", titleColor: .white, colorOn: .green, colorOff: .red.opacity(0.8)) {
                Circle()
                    .fill(.clear)
                    .overlay {
                        Image(systemName: "power")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 30)
                    }
            } didComplete: { value in
                print("Switch value: \(value)")
            }
        }
    }
}

struct SliderToButtonEx: View {
    
    @State private var thumbColor = Color.green
    @State private var thumbColor2 = Color.red
    @State private var icon = "chevron.right.2"
    @State private var icon2 = "trash"
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Slider to button")
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            // slide to call
            SliderToButton(width: UIScreen.main.bounds.width - 32, height: 80, title: "Slide to call", titleColor: .black, bgColor: thumbColor.opacity(0.4), initialMode: .slider) {
                Circle()
                    .fill(thumbColor)
                    .padding(6)
                    .overlay {
                        Image(systemName: "phone.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 30)
                    }
                
            } didFinishSliding: {
                withAnimation {
                    thumbColor = .red
                }
            } didClick: {
                withAnimation {
                    thumbColor = .green
                }
            }
            
            // slide right
            SliderToButton(width: UIScreen.main.bounds.width - 32, height: 80, title: "Slide right", titleColor: .black, bgColor: .gray.opacity(0.4), initialMode: .slider) {
                Circle()
                    .fill(.gray)
                    .padding(6)
                    .overlay {
                        Image(systemName: icon)
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 25)
                    }
                
            } didFinishSliding: {
                icon = "xmark"
            } didClick: {
                icon = "chevron.right.2"
            }
            
            // slide to remove
            SliderToButton(width: UIScreen.main.bounds.width - 32, height: 80, title: "Slide to remove", titleColor: .black, bgColor: thumbColor2.opacity(0.4), initialMode: .slider) {
                Circle()
                    .fill(thumbColor2)
                    .padding(6)
                    .overlay {
                        Image(systemName: icon2)
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 25)
                    }
                
            } didFinishSliding: {
                icon2 = "checkmark"
                withAnimation {
                    thumbColor2 = Color.blue
                }
            } didClick: {
                icon2 = "trash"
                withAnimation {
                    thumbColor2 = Color.red
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

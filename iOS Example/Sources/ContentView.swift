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
            
            RatingSliderEx()
            
            StepsSliderEx()
            
            SwitchSliderEx()
            
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
    var body: some View {
        VStack(spacing: 10) {
            Text("Slider to button")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            
            SliderToButton(width: UIScreen.main.bounds.width - 32, height: 80, title: "Slide to call", titleColor: .black, bgColor: .green.opacity(0.8), initialMode: .button) {
                Circle()
                    .fill(.white)
                    .padding(6)
                    .overlay {
                        Image(systemName: "phone.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .scaledToFit()
                            .frame(width: 30)
                    }
                
            } didFinishSliding: {
                print("Finish sliding !")
            } didClick: {
                print("did click !")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

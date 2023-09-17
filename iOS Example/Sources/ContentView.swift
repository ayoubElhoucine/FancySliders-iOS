//
//  ContentView.swift
//  iOS Example
//
//  Created by Ayoub on 5/9/2023.
//

import Foundation
import SwiftUI
import FancySliders


struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
//            RatingSliderEx()
//
            StepsSliderEx()

//            SwitchSliderEx()
            
//            SliderToButtonEx()

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
    
    @State private var text = "1"
    @State private var color = Color.gray
    
    @State private var emoji = "angry_emoji"
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Slider with five steps")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            StepSlider(width: UIScreen.main.bounds.width - 32, height: 60, stepCount: 5) {
                Circle()
                    .fill(color)
                    .padding(5)
                    .overlay {
                        Text(text).fontWeight(.bold).foregroundColor(.white)
                    }
            } content: {
                Capsule().fill(color.opacity(0.2))
                    .overlay {
                        Capsule().stroke(color, lineWidth: 1)
                        Text("Slide right").fontWeight(.semibold)
                    }
            } onSliding: { value in
                text = (value + 1).description
                switch value {
                case 0: color = .gray
                case 1: color = .blue
                case 2: color = .green
                case 3: color = .orange
                case 4: color = .red
                default: break
                }
            } didComplete: { value in
                print("did complete: value: \(value)")
            }
            
            Spacer().frame(height: 10)
            
            Text("Slider with four steps")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            StepSlider(width: UIScreen.main.bounds.width - 32, height: 60, stepCount: 4) {
                Image(emoji)
                    .resizable()
                    .frame(width: 55, height: 55)
            } content: {
                Capsule().fill(Color.yellow.opacity(0.1))
                    .overlay {
                        Capsule().stroke(.yellow, lineWidth: 2)
                        Text("Slide right").fontWeight(.semibold)
                    }
            } onSliding: { value in
                switch value {
                case 0: emoji = "angry_emoji"
                case 1: emoji = "simple_emoji"
                case 2: emoji = "lough_emoji"
                case 3: emoji = "lovely_emoji"
                default: break
                }
            } didComplete: { value in
                print("did complete: value: \(value)")
            }
            
            Spacer().frame(height: 10)
            
            Text("Slider with two steps")
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            StepSlider(width: UIScreen.main.bounds.width - 32, height: 60, stepCount: 2) {
                Circle()
                    .fill(.red)
                    .padding(5)
                    .overlay {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(height: 22)
                    }
            } content: {
                Capsule().fill(Color.red.opacity(0.2))
                    .overlay {
                        Capsule().stroke(.red, lineWidth: 1)
                        Text("Slide right").fontWeight(.semibold)
                    }
            } onSliding: { value in
                switch value {
                case 0: emoji = "angry_emoji"
                case 1: emoji = "simple_emoji"
                case 2: emoji = "lovely_emoji"
                default: break
                }
            } didComplete: { value in
                print("did complete: value: \(value)")
            }
                
        }
    }
}

struct SwitchSliderEx: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Switch Slider")
                .fontWeight(.bold)
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            
            SwitchSlider(width: UIScreen.main.bounds.width - 60, height: 80, title: "Switch On", titleColor: .black, colorOn: .green, colorOff: .red.opacity(0.3)) {
                Circle()
                    .fill(.white)
                    .padding(6)
                    .overlay {
                        Image(systemName: "power")
                            .resizable()
                            .foregroundColor(.green)
                            .scaledToFit()
                            .frame(width: 30)
                    }
            } didComplete: { value in
                print("Switch value: \(value)")
            }
            
            SwitchSlider(width: UIScreen.main.bounds.width - 60, height: 80, title: "Switch On", titleColor: .black, colorOn: .green, colorOff: .gray.opacity(0.3)) {
                Circle()
                    .fill(.green)
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
            
            SwitchSlider(width: UIScreen.main.bounds.width - 60, height: 80, title: "Switch On", titleColor: .black, colorOn: .blue, colorOff: .blue.opacity(0.2)) {
                Circle()
                    .fill(.blue)
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
                .padding(.bottom, 40)
            
            
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

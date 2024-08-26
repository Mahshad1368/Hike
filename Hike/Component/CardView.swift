//
//  CardView.swift
//  Hike
//
//  Created by Mahshad Jafari on 23.08.24.
//

import SwiftUI

struct CardView: View {
    
    //MARK: -PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    //MARK: _FUNCTION
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber

        imageNumber = randomNumber
    }
    
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - Header
                VStack(alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight,
                                             .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        Spacer()
                        
                        Button {
                            print("buttttton")
                        }label: {
                            CostumButtonView()
                            
                        }
                    }
                    Text("Fun and enjoable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                }  //: HEADER
                .padding(.horizontal, 30)
                //MARK: - MAIN CONTENT
                
                ZStack {
    
                    CustomeCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                //MARK: _FOOTER
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenDark
                                ],
                                startPoint: .top ,
                                endPoint: .bottom)
                        ).shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
            
        }
        .frame(width: 320, height: 570)
    }
}
    

#Preview {
    CardView()
}

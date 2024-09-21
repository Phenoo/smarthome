//
//  MusicModelView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import SwiftUI
import UIKit

struct MusicModelView: View {
    @State private var speed = 50.0
    @State private var isEditing = false

    @Binding var showPopUp: Bool
    
    var body: some View {
        VStack(spacing: 50){
         
            HStack(alignment: .center){
                Image(systemName: "chevron.left")
                    .font(.title3)
                Spacer()
                Text("Music System")
                    .font(Font.custom("Telegraf-UltraBold", size: 20))
                Spacer()
            }
            
            
            VStack {
                Image(systemName: "hifispeaker.fill")
                    .foregroundStyle(.black)
                    .font(.title)
                    .padding()
                    .background {
                        Circle()
                            .fill(Color.customYellow)
                    }
                VStack(spacing: 16){
                    HeaderTitle(title: "JBL Speaker", description: "Living Room")
                        .padding(.top)
                    
                    Image("music")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .clipShape(Circle())
                        .background {
                            Circle()
                                .stroke(.black)
                        }
                    VStack {
                        Text("Heat Waves")
                            .font(Font.custom("Telegraf-UltraBold", size: 18))
                        
                        Text("By Glass Animals")
                            .font(.caption)
                    }
                   
                    VStack {
                        Slider(
                                   value: $speed,
                                   in: 0...100,
                                   onEditingChanged: { editing in
                                       isEditing = editing
                                   }
                        )
                    
                        .foregroundStyle(.black)
                        .tint(.black)
                        
                        HStack{
                            Text("01:45")
                            Spacer()
                            Text("03:15")
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    }
                    
                    HStack {
                        ImageViewButton(image: "arrow.clockwise")
                        Spacer()
                        HStack {
                            ImageViewButton(image: "backward.end")
                            ImageViewButton(image: "play.fill")
                            ImageViewButton(image: "forward.end")
                        }
                        Spacer()
                        ImageViewButton(image: "shuffle")

                    }
                    
                    Image(systemName: "power")
                        .font(.title)
                        .foregroundStyle(Color.customYellow)
                        .frame(width: 100, height: 100)
                        .background {
                            Circle()
                                .fill(.black)
                                .background {
                                    Circle()
                                        .fill(Color.customYellow)
                                        .padding(-2)
                                }
                        }
                        .onTapGesture {
                            showPopUp.toggle()
                        }
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.black)
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.customYellow)
                        .padding(.bottom, 55)
                }
                Spacer()

            }
        }
        .padding()
    }
}

#Preview {
    MusicModelView(showPopUp: .constant(true))
        .preferredColorScheme(.dark)
}

struct ImageViewButton: View {
    
    let image: String
    var body: some View {
        Image(systemName: image)
            .padding(10)
            .background {
                Circle()
                    .stroke()
            }
    }
}

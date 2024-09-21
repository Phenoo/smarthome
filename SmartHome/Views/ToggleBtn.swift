//
//  ToggleBtn.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import SwiftUI

struct ToggleBtn: View {
    @State var isDarkMode: Bool = false
    @State  var leftName: String = "Off"
    @State  var rightName: String = "On"
    
    let foreColor: Color
    let backColor: Color
    
    
    var body: some View {
               ZStack{
                   Capsule()
                       .fill(.black)
                       .frame(width: 90,height: 60)
                   HStack{
                       ZStack{
                           Rectangle()
                               .fill(backColor)
                               .frame(width: 40,height: 45)
                               .onTapGesture {
                                   withAnimation {
                                       isDarkMode.toggle()
                                   }
                               }
                               .clipShape(
                                isDarkMode ?
                                   .rect(
                                       topLeadingRadius: 5,
                                       bottomLeadingRadius: 5,
                                       bottomTrailingRadius: 20,
                                       topTrailingRadius: 20
                                   )
                                :
                                        .rect(
                                            topLeadingRadius: 20,
                                            bottomLeadingRadius: 20,
                                            bottomTrailingRadius: 5,
                                            topTrailingRadius: 5
                                        )

                               )
                               .offset(x: isDarkMode ? 50 : 8)
                           
                           Text("\(leftName)")
                               .font(Font.custom("Telegraf-Ultra-Bold", size: 12))
                               .padding(.leading, 20)
                               .foregroundStyle(foreColor)
                               .opacity(isDarkMode ? 0 : 1)

                       }
                       ZStack{
                           Capsule()
                               .fill(.clear)
                               .frame(width: 50,height: 48)
                           Text("\(rightName)")
                               .font(Font.custom("Telegraf-Regular", size: 14))
                               .foregroundStyle(foreColor)
                               .padding(.trailing, 15)
                               .opacity(isDarkMode ? 1 : 0)
                       }
                   }
               }
       }
}

#Preview {
    ToggleBtn(foreColor: .black, backColor: .red)
        .preferredColorScheme(.dark)
}

struct DarkModeView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(width: 50,height: 48)
            .onTapGesture {
                withAnimation {
                    isDarkMode.toggle()
                }
            }
            .clipShape(
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 20,
                    topTrailingRadius: 20
                )
            )
            .offset(x: isDarkMode ? 55 : 0)
    }
}

struct LightModeView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        Rectangle()
            .fill(.yellow)
            .frame(width: 50,height: 48)
            .onTapGesture {
                isDarkMode.toggle()
            }
            .clipShape(
                .rect(
                    topLeadingRadius: 20,
                    bottomLeadingRadius: 20,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 0
                )
            )
            .offset(x: isDarkMode ? 55 : 0)
            .animation(.smooth(duration: 0.5))
    }
}


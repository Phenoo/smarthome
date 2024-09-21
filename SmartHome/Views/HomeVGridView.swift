//
//  HomeVGridView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import SwiftUI

struct HomeVGridView: View {
    @State private var showPopup: Bool = false
    @State private var showPopupLink: Bool = false


    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 0) {
            LightBulbViewImage()
            MusicContainer(showPopup: $showPopup)
            VStack {
                HStack {
                    VStack(alignment: .leading){
                        VStack {
                            Text("CCTV")
                                .font(Font.custom("Telegraf-UltraBold", size: 13))
                            
                            Text("Main Gate")
                                .font(.caption)
                        }
                        .padding(.leading, 8)
                    }

                    
                    ToggleBtn(foreColor: Color.black, backColor: Color.customYellow)
                }
                .background {
                    Capsule()
                        .fill(.black)
                        .stroke(.gray.opacity(0.3), lineWidth: 3)
                }
                
                
                RadioSubView()
                    .onTapGesture {
                        showPopupLink = true
                    }
            }
            .offset(y: -30)

            
            KitchenView()
                .offset(y: -20)
        }
        .popView(isPresented: $showPopup) {
            
        } content: {
            MusicModelView(showPopUp: $showPopup)
                .padding(.top, 40)
        }
        .popView(isPresented: $showPopupLink) {
            
        } content: {
            LinkModelView(showPopUp: $showPopupLink)
                .padding(.top, 40)
        }

    }
}

#Preview {
    HomeVGridView()
        .preferredColorScheme(.dark)
}

struct LightBulbViewImage: View {
    var body: some View {
        VStack{
            HeaderTitle(title: "Phils Led Bulb", description: "Main Red Room")
                .foregroundStyle(.white)
            VStack(spacing: 0){
                Image("light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 70)
                ToggleBtn(foreColor: Color.white, backColor: Color.customBlue)
            }
        }
        .padding(8)
        .padding(.top)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.customBlack)
        }
    }
}

struct RadioSubView: View {
    var body: some View {
        VStack(spacing: 16){
            HeaderTitle(title: "TP Link", description: "Connected")
            
            VStack(spacing: 8){
                HStack {
                    Image(systemName: "arrow.down.circle")
                        .font(.title2)
                    Text("98.65")
                        .font(Font.custom("Telegraf-Regular", size: 22))

                }
                Text("MBPS Downloading")
                    .font(Font.custom("Telegraf-Regular", size: 12))
                    .opacity(0.8)

            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .padding()
            .background {
                Capsule().fill(.black)
            }
        }
        .padding(.top)
        .padding([.bottom, .horizontal], 8)
        
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 45)
                .fill(Color.customPurple)
        }
    }
}



struct KitchenView: View {
    var body: some View {
        VStack {
            HeaderTitle(title: "Cleaning", description: "Kitchen")
         
            Image("sweeper")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 140)
                .overlay{
                    ToggleBtn(foreColor: Color.black, backColor: Color.customRed)
                        .offset(y: 20)
                }
            
        }
        .padding(8)
        .padding(.top)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.customBlack)
        }
    }
}

struct MusicSubView: View {
    var body: some View {
        VStack {
            
            VStack(spacing: 12){
                
                VStack {
                    HeaderTitle(title: "JBL Speaker", description: "Living Room")
                }
                
                HStack {
                    Image(systemName: "chevron.left")
                    
                    ZStack {
                        Image("music")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                            .clipShape(Circle())
                        
                    }.overlay{
                        HStack {
                            Image(systemName: "play.fill")
                                .padding(12)
                                .background {
                                    Circle()
                                        .fill(Color.customYellow)
                                        .stroke(Color.black)
                                }
                        }
                    }
                    
                    Image(systemName: "chevron.right")
                }
                
                VStack {
                    Text("Heat Waves")
                        .font(Font.custom("Telegraf-UltraBold", size: 18))
                    
                    Text("By Glass Animals")
                        .font(.caption)
                }
                
                
            }
            .padding()
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .background {
                Rectangle()
                    .fill(Color.customYellow)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 45,
                            bottomLeadingRadius: 45,
                            bottomTrailingRadius: 45,
                            topTrailingRadius: 0
                        ))
            }
        }.frame(maxWidth: .infinity)
    }
}

struct MusicContainer: View {
    @Binding var showPopup: Bool
    var body: some View {
        VStack(alignment: .trailing, spacing: 0){
            HStack {
                ToggleBtn(foreColor: Color.black, backColor: Color.customYellow)
            }
            .padding([.trailing, .bottom, .top], 4)
            .background {
                Rectangle()
                    .fill(Color.customYellow)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 45,
                            bottomLeadingRadius: 45,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 45
                        ))
            }
            MusicSubView()
                .onTapGesture {
                    showPopup = true
                }
            
        }
        .offset(y: -35)
    }
}

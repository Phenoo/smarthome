//
//  HomeView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import SwiftUI

struct PolygonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the points for the polygon based on the CSS clip-path
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: width * 0.7, y: 0))        // 50% 0%
        path.addLine(to: CGPoint(x: width, y: 0))           // 100% 0%
        path.addLine(to: CGPoint(x: width * 0.75, y: height * 0.80)) // 71% 65%
        path.addLine(to: CGPoint(x: 0, y: height))          // 0% 100%
        path.addLine(to: CGPoint(x: 0, y: 0))               // 0% 0%
        path.closeSubpath()
        
        return path
    }
}

struct HomeView: View {
    @State private var showPopup: Bool = false
    @State private var isVisible = false

    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.customBlue)
                                .cornerRadius(60)
                                .frame(height: 180)
                                .overlay(alignment: .leading) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Spacer()
                                            .frame(height: 40)
                                        Text("Good Morning,")
                                            .font(Font.custom("Telegraf-UltraBold", size: 32))
                                            .fontWeight(.bold)
                                        
                                        Text("Welcome to Smart Home")
                                            .font(Font.custom("Telegraf-Regular", size: 15))
                                        
                                    }
                                    .padding(.top)
                                    .padding(.horizontal, 20)
                                }
                        }.overlay(alignment: .bottomTrailing) {
                            VStack {
                                Image("user")
                                    .resizable()
                                    .scaledToFit()
                                    .font(.title)
                                    .clipShape(Circle())
                                    .foregroundStyle(.white)
                                    .frame(width: 100, height: 100)
                                    .background {
                                        Circle()
                                            .fill(.blue.gradient)
                                            .background {
                                                Circle()
                                                    .fill(.background)
                                                    .padding(-5)
                                            }
                                    }
                            }
                            .offset(y: -10)
                        }
                        
                        HStack(alignment: .top,spacing: 0) {
                            
                            
                            VStack(spacing: 14) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                    Spacer()
                                    VStack {
                                        Text("O General AC")
                                            .font(Font.custom("Telegraf-UltraBold", size: 20))
                                        
                                        Text("Living Room")
                                            .font(.caption)
                                    }
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                    
                                }
                                .padding(.top, 8)
                                .padding(.horizontal, 10)
                                
                                HStack(spacing: 2){
                                    ExtractedView(image: "minus")
                                    
                                    VStack {
                                        HStack {
                                            Text("19°C")
                                                .frame(maxWidth: .infinity)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 20)
                                        }
                                        .background {
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(lineWidth: 2)
                                        }
                                        HStack {
                                            CircleViewImage(image: "fan.fill")
                                            
                                            CircleViewImage(image: "light.beacon.min.fill")
                                        }
                                    }
                                    
                                    ExtractedView(image: "plus")
                                    
                                }
                                
                            }
                            .padding(4)
                            .padding(.horizontal, 0)
                            .frame(width: 280)
                            .foregroundStyle(.black )
                            .background {
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(Color.customGreen)
                            }
                            
                            VStack {
                                Image(systemName: "power")
                                    .font(.title)
                                    .foregroundStyle(Color.customGreen)
                                    .frame(width: 85, height: 85)
                                    .background {
                                        Circle()
                                            .fill(.black)
                                            .background {
                                                Circle()
                                                    .fill(Color.customGreen)
                                                    .padding(-5)
                                            }
                                    }
                            }
                            .onTapGesture {
                                showPopup = true
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        VStack {
                            if isVisible {
                                HomeVGridView()
                                    .padding(.horizontal, 0)
                                    .offset(y: -28)
                            }
                        }
                        .onAppear {
                            withAnimation(.linear) {
                                isVisible = true
                            }
                        }
                        
                      
                        
                       
                        
                        Spacer()
                    }
                }
                
            }
            .popView(isPresented: $showPopup, onDismiss: {}, content: {
                AirConditionerView(showPopUp: $showPopup)
                    .padding(.top, 40)
            })
            .edgesIgnoringSafeArea(.top)
            .safeAreaPadding(.bottom, 60)
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    let image: String
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: image)
                .font(.title3)
                .foregroundStyle(Color.customGreen)
                .padding()
            
        }
        .frame(width: 70,height: 90)
        .background {
            RoundedRectangle(cornerRadius: 40)
        }
    }
}

struct CircleViewImage: View {
    let image: String

    var body: some View {
        VStack {
            Image(systemName: image)
                .font(.title)
                .padding(8)
        }
        .background {
            Circle()
                .stroke()
        }
    }
}

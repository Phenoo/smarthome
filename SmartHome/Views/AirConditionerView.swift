//
//  AirConditionerView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 18/09/2024.
//

import SwiftUI

struct AirConditionerView: View {
    
    @Binding var showPopUp: Bool

    @State var progress: CGFloat = 50

    
    var body: some View {
        VStack(spacing: 50){
         
            HStack(alignment: .center){
                Image(systemName: "chevron.left")
                    .font(.title3)
                Spacer()
                Text("Air Conditiioner")
                    .font(Font.custom("Telegraf-UltraBold", size: 20))
                Spacer()
            }
            
            
            VStack {
                Image(systemName: "snowflake")
                    .foregroundStyle(.black)
                    .font(.title)
                    .padding()
                    .background {
                        Circle()
                            .fill(Color.customGreen)
                    }
                VStack(spacing: 8){
                    HStack {
                        Image(systemName: "chevron.left")
                        Spacer()
                        HeaderTitle(title: "O General AC", description: "Living Room")
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                        
                    }
                    .padding(.horizontal, 8)

                    Speedmeter(progress: $progress)
                   
                    HStack {
                        Text("16°C")
                        Spacer()
                        Text("30°C")
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    HStack(spacing: 16){
                        ACItemView(image: "leaf.fill", title: "Eco Mode", sub: "On")
                        ACItemView(image: "fan.fill", title: "Fan Speed", sub: "On")
                        ACItemView(image: "wind", title: "Swing", sub: "On")
                        ACItemView(image: "clock.fill", title: "Timer", sub: "07AM - 10AM")
                    }
                    .padding(.top)
                    .padding(.horizontal, 10)

                    
                    Text("Auto Mode")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 12)
                        .background {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                        }
               
                    Image(systemName: "power")
                        .font(.title)
                        .foregroundStyle(Color.customGreen)
                        .frame(width: 100, height: 100)
                        .background {
                            Circle()
                                .fill(.black)
                                .background {
                                    Circle()
                                        .fill(Color.customGreen)
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
                        .fill(Color.customGreen)
                        .padding(.bottom, 55)
                }
                Spacer()

            }
        }
        .padding()
    }
    }

#Preview {
    AirConditionerView(showPopUp: .constant(false))
        .preferredColorScheme(.dark)
}

struct ACItemView: View {
    
    let image: String
    let title: String
    let sub: String
    
    var body: some View {
        VStack{
            ImageViewButton(image: image)
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(sub)
                .font(.caption)
                .foregroundStyle(.black.opacity(0.5))
        }
    }
}


struct Speedmeter: View {
    @Binding var progress: CGFloat


    var body: some View {
            ZStack {
                // Circular progress bar
                ZStack {
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(Color.black.opacity(0.25), lineWidth: 5)
                        .frame(width: 280, height: 280)
                    Circle()
                        .trim(from: 0, to: self.setProgress())
                        .stroke(AngularGradient(gradient: .init(colors: [.black, .blue]), center: .center), lineWidth: 5)
                        .frame(width: 280, height: 280)
                }
                .rotationEffect(.init(degrees: 180))
                // Arrow indicator
                ZStack (alignment: .bottom) {
                    // Arrow stem
                    VStack {
                        Text("23°C")
                            .font(Font.custom("Telegraf-UltraBold", size: 45))
                        
                        Text("AC Temperature")
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                   
                }
                .offset(y: -35)
//                .rotationEffect(.init(degrees: -90))
//                .rotationEffect(.init(degrees: self.setArrow()))

            }
            .padding()
            .padding(.bottom, -160)
        }
    

    func setProgress() -> CGFloat {
           let temp = self.progress / 2
           return (temp * 0.01)
       }
    
    func setArrow() -> Double {
          let temp = self.progress/100
          return (temp * 180)
      }
}

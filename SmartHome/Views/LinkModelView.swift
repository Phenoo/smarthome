//
//  LinkModelView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 18/09/2024.
//

import SwiftUI
import Charts


struct LinkModelView: View {
@State private var speed = 50.0
@State private var isEditing = false

@Binding var showPopUp: Bool

var body: some View {
    VStack(spacing: 50){
     
        HStack(alignment: .center){
            Image(systemName: "chevron.left")
                .font(.title3)
            Spacer()
            Text("WiFi")
                .font(Font.custom("Telegraf-UltraBold", size: 20))
            Spacer()
        }
        
        
        VStack {
            Image(systemName: "wifi.router")
                .foregroundStyle(.black)
                .font(.title)
                .padding()
                .background {
                    Circle()
                        .fill(Color.customPurple)
                }
            VStack(spacing: 16){
                HeaderTitle(title: "TP Link", description: "Connected")
                    .padding(.top)
                
                VStack {
                    HStack {
                        VStack(spacing: 4){
                            Label("765.65", systemImage: "arrow.down.circle")
                                .font(Font.custom("Telegraf-Regular", size: 20))
                            Text("MBPS Downloading")
                                .font(Font.custom("Telegraf-Regular", size: 14))
                        }
                        Divider()
                            .frame(width: 1 ,height: 50)
                            .background(.black)
                            .padding(.horizontal)
                        
                        VStack(spacing: 4){
                            Label("765.65", systemImage: "arrow.up.circle")
                                .font(Font.custom("Telegraf-Regular", size: 20))

                            Text("MBPS Uploading")
                                .font(Font.custom("Telegraf-Regular", size: 14))
                        }
                    }.padding(.bottom, 8)
                    
                    Divider()
                        .frame(height: 1)
                        .background(.black)
                    
                    
                    HStack {
                        Text("Ping")
                        Label("2", systemImage: "arrow.up.arrow.down")
                        Label("2", systemImage: "arrow.down.circle")
                        Label("2", systemImage: "arrow.up.circle")
                    }
                    .font(Font.custom("Telegraf-Regular", size: 14))
                    .padding(.top, 8)

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                }
                
                DataChart()
                    .frame(height: 150)
                
                HStack {
                    HStack {
                        ImageViewButton(image: "arrow.up.arrow.down")
                        VStack(alignment: .leading){
                            Text("Connections")
                                .font(Font.custom("Telegraf-Regular", size: 16))
                                .fontWeight(.semibold)

                            Text("Multi")
                                .font(.caption)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    HStack {
                        ImageViewButton(image: "network")
                        VStack(alignment: .leading){
                            Text("BlazeNet Ltd.")
                                .font(Font.custom("Telegraf-Regular", size: 16))
                                .fontWeight(.semibold)

                            Text("27.109.16.24")
                                .font(.caption)
                        }
                    }
                    .frame(maxWidth: .infinity)

                }
             
                
                Image(systemName: "power")
                    .font(.title)
                    .foregroundStyle(Color.customPurple)
                    .frame(width: 100, height: 100)
                    .background {
                        Circle()
                            .fill(.black)
                            .background {
                                Circle()
                                    .fill(Color.customPurple)
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
                    .fill(Color.customPurple)
                    .padding(.bottom, 55)
            }
            Spacer()

        }
    }
    .padding()
}
}


struct Profit: Identifiable {
    var id: String
    let department: String
    let profit: Double
}




struct DataChart: View {
    @State private var selected: Double? = 6000
    
    let data: [Profit] = [
        Profit(id: "1", department: "02 Jan", profit: 5000),
        Profit(id: "2" ,department: "03 Jan", profit: 8000),
        Profit(id: "3", department: "04 Jan", profit: 10000),
        Profit(id: "4", department: "05 Jan", profit: 6000),
        Profit(id: "5" ,department: "06 Jan", profit: 9000),
        Profit(id: "7", department: "07 Jan", profit: 5000)
    ]
    var body: some View {
        Chart(data) {
               BarMark(
                   x: .value("Department", $0.department),
                   y: .value("Profit", $0.profit)
                    
               )
               .clipShape(RoundedRectangle(cornerRadius: 10))
               .annotation(content: {
               })
               .foregroundStyle($0.profit != selected ?  .black.opacity(0.15) : .black)
           }
        .chartXAxis {
            AxisMarks { value in
                AxisValueLabel() {
                    Text(value.as(String.self) ?? "")
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                }
            }
        }
        
        .chartXSelection(value: $selected)
        
        .chartYAxis(.hidden)
    }
}

#Preview {
    LinkModelView(showPopUp: .constant(false))
    .preferredColorScheme(.dark)
}



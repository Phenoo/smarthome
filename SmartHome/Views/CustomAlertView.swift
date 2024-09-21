//
//  CustomAlertView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import SwiftUI

//struct CustomAlertView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    CustomAlertView()
//}
//import SwiftUI

struct CustomAlertView: View {
    
    @Binding var showAlert: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.badge.key.fill")
                .font(.title)
                .foregroundStyle(.white)
                .frame(width: 65, height: 65)
                .background {
                    Circle()
                        .fill(.blue.gradient)
                        .background {
                            Circle()
                                .fill(.background)
                                .padding(-5)
                        }
                }
            
            VStack {
                Text("Testing")

            }
            .background()
            .frame(height: 200)
        }
        .frame(width: 250)
        .padding([.horizontal, .bottom], 25)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(.background)
                .padding(.top, 25)
        }
    }
}

#Preview {
    CustomAlertView(showAlert: .constant(true))
}

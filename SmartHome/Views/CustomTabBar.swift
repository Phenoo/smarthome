//
//  CustomTabBar.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var activeTab: TabModel
    
    var activeBarBackground : Color = .black
    var activeBarForeground : Color = .black

    
    @Namespace private var animation
    
    
    @State private var tabLocation : CGRect = .zero
    
    var body: some View {
        HStack(spacing: 2){
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                Button{
                        activeTab = tab
                    
                } label: {
                    HStack(alignment: .center, spacing: 5) {
                        Image(systemName: tab.rawValue)
                            .font(.title2)
                            .frame(width: 30, height: 30)
                        
                        if activeTab == tab {
                            Text(tab.title)
                                .font(Font.custom("Telegraf-UltraBold", size: 16))
                                .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                    }
                    .foregroundStyle(activeTab == tab ? activeBarForeground : .gray)
                    .padding(.vertical, 10)
                    .padding(.horizontal, activeTab == tab ? 30: 20)
//                    .padding(.leading, 10)
//                    .padding(.trailing, 15)
                    .contentShape(.rect)
                    .background {
                        if activeTab == tab {
                            Capsule()
                                .fill(Color.customGreen)
//                                .onGeometryChange(for: CGRect.self, of: {
//                                    $0.frame(in: .named("TABBARVIEW"))
//                                }, action: {newValue in
//                                    tabLocation = newValue
//                                })
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        } else {
                            Capsule()
                                .fill(Color.customBlack)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
            
        }
        .coordinateSpace(.named("TABBARVIEW"))
        .padding(.horizontal, 5)
        .frame(height: 45)
        .background(
            .background
                .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
            in: .capsule

        )
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

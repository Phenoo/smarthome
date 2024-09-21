//
//  ContentView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeTab: TabModel = .home
    @State private var isTabBarHidden: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab){
                HomeView()
                    .tag(TabModel.home)
                    .background {
                        if !isTabBarHidden {
                            HideTabBar {
                                print("hidden")
                                isTabBarHidden = true
                            }
                        }
                    }
                
                DeviceView()
                    .tag(TabModel.search)
                
                
                SafetyView()
                    .font(Font.custom("Telegraf-Regular", size: 30))
                    .tag(TabModel.safety)
                
                
                Text("Settings")
                    .tag(TabModel.settings)
            }.safeAreaPadding(.bottom, 60)
            CustomTabBar(activeTab: $activeTab)
        }.preferredColorScheme(.dark)
    }
}


struct HideTabBar: UIViewRepresentable {
    var result : () -> ()
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let tabcontroller = view.tabcontroller {
                tabcontroller.tabBar.isHidden = true
                result()
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


extension UIView {
    var tabcontroller: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: { $0 is UITabBarController }) as? UITabBarController {
            return controller
        }
        
        return nil
    }
}

#Preview {
    ContentView()
}

//
//  SafetyView.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 18/09/2024.
//

import SwiftUI

struct Property: Identifiable {
    var id: String
    let name: String
    let image: String
}

enum Safety: String, CaseIterable {
    case security = "Security"
    case CCTV = "CCTV Camera"
    case door = "Door Lock"
    case locker = "Locker"

}

struct SafetyView: View {
    
    @State private var selected: Safety = .security
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Safety.allCases, id: \.self) { item in
                            Button(item.rawValue) {
                                selected = item
                            }
                            .foregroundStyle(selected == item ? .white : .gray)
                            .padding()
                            .font(Font.custom("Telegraf-Regular", size: 16))
                        }
                    }
                }
                
                switch selected {
                case .security:
                    SecurityView()
                case .CCTV:
                    CCTVView()
                case .door:
                    EmptyView()
                case .locker:
                    EmptyView()
                }
                
               
                
            }
            .padding(8)
            .navigationTitle("Safety")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SafetyView()
        .preferredColorScheme(.dark)
}


struct CCTVView: View {
    let items: [Property] = [
        Property(id: "1", name: "Living Room", image: "living"),
        Property(id: "2", name: "Kids Room", image: "bedroom"),
        Property(id: "3", name: "Kitchen", image: "kitchen"),
        Property(id: "4", name: "Locker", image: "locker")
    ]
    var body: some View {
        VStack {
            ForEach(items) { item in
                VStack (spacing: 4){
                    HStack {
                        Spacer()
                        Text(item.name)
                            .font(Font.custom("Telegraf-UltraBold", size: 18))
                        Spacer()
                        Image(systemName: "ellipsis")
                            .rotationEffect(.init(degrees: 90))
                    }
                    .padding()
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay {
                            VStack {
                                Image(systemName: "play.fill")
                                    .padding()
                                    .background {
                                        Circle()
                                            .fill(.black.opacity(0.5))
                                            .stroke(.white, lineWidth: 1)
                                    }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.black.opacity(0.3))
                            }
                        }

                }
                .padding(.horizontal, 8)
                .background {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.customBlack)
                }
            }
        }

    }
}

struct SecurityView: View {
    let items: [Property] = [
        Property(id: "1", name: "Living Room", image: "living"),
        Property(id: "2", name: "Kids Room", image: "bedroom"),
        Property(id: "3", name: "Kitchen", image: "kitchen"),
        Property(id: "4", name: "Locker", image: "locker")
    ]
    var body: some View {
        VStack{
            VStack(spacing: 16) {
                VStack(spacing: 8){
                    Text("Security Report")
                        .font(.caption)
                    Text("My Home")
                        .font(Font.custom("Telegraf-UltraBold", size: 18))
                        .padding(.bottom, 8)
                    
                    Text("No problem detetcted")
                        .padding(10)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .background {
                            Capsule()
                                .fill(Color.green)
                        }
                    
                }
                
                HStack {
                    Label("All camera active", systemImage: "video.fill")
                    Spacer()
                    Label("All camera active", systemImage: "key.horizontal.fill")
                    
                }
                
                .padding(.bottom, 5)
                .font(.subheadline)
                
                
                HStack {
                    Label("All camera active", systemImage: "lock.fill")
                    Spacer()
                    Label("All camera active", systemImage: "rectangle.and.text.magnifyingglass")
                }
                .font(.subheadline)
                
                Button {
                    
                } label: {
                    Text("SOS")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background {
                    Capsule()
                        .fill(.red)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.customBlack)
            }
            
            HStack {
                Image(systemName: "lock.fill")
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding()
                    .background {
                        Circle()
                            .fill(Color.customYellow)
                    }
                
                VStack(alignment: .leading) {
                    Text("The door is locked")
                        .font(Font.custom("Telegraf-UltraBold", size: 18))
                    
                    Text("Swipe to unlock")
                        .font(.caption)
                }
                Spacer()
            }
            .padding(4)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.customBlack)
                    .stroke(.gray.opacity(0.2), lineWidth: 2)
            }
            
            CCTVView()
        }

    }
}

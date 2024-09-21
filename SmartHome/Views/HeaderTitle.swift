//
//  HeaderTitle.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import SwiftUI

struct HeaderTitle: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(Font.custom("Telegraf-UltraBold", size: 20))
            
            Text(description)
                .font(.caption)
        }    }
}


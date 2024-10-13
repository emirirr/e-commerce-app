//
//  AppBarComponent.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct AppBarComponent: View {
    var body: some View {
        HStack{
            
            Button(action: {
                
                
            }) {
                Label("", systemImage: "text.alignleft")
                    .padding(.left,10)
                    .foregroundColor(.black)
            }
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            
            Spacer()
            Image("avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .padding(.right,10)
            
                    }
    }
    
}

#Preview {
    AppBarComponent()
}

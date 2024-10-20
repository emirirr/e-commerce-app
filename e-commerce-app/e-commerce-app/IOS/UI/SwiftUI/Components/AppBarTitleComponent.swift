//
//  AppBarTitleComponent.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct AppBarTitleComponent: View {
    public var title: String
    public let onTapBack: () -> ()
    var body: some View {
        HStack{
            
            Button(action: {
                onTapBack()
                
            }) {
                Image("back-arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
            }
            Spacer()
            Text(title).padding(.right,30)
            
            Spacer()
            
        }.padding(.top,10)
    }
}

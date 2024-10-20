//
//  LargeButtonStyle.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI


struct LargeButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    let maxWidth : CGFloat
    let padding : CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding(padding)
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(currentForegroundColor, lineWidth: 1)
        )
          
            .font(Font.system(size: 15, weight: .semibold))
    }
}

struct LargeButton: View {
    
    var buttonHorizontalMargins: CGFloat
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let title: String
    private let action: () -> Void
    var maxWidth : CGFloat
    var padding : CGFloat
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.green,
         foregroundColor: Color = Color.white,
         maxWidth : CGFloat = 155,
         buttonHorizontalMargins : CGFloat = 2,
         padding : CGFloat = 7,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.padding = padding
        self.buttonHorizontalMargins = buttonHorizontalMargins
        self.maxWidth = maxWidth
        self.disabled = disabled
    }
    
    var body: some View {
        HStack {
            Spacer(minLength: buttonHorizontalMargins)
            Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(LargeButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled, maxWidth: maxWidth,padding: padding))
                .disabled(self.disabled)
            Spacer(minLength: buttonHorizontalMargins)
        }
        .frame(maxWidth:maxWidth)
    }
}

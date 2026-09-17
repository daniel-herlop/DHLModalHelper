//
//  DHLCustomModal.swift
//  iSquadFanClub
//
//  Created by Daniel Hernandez on 16/09/2026.
//

import Foundation
import SwiftUI

struct DHLCustomModal: View {
    
    internal init(title: String = "", subtitle: String = "", firstButtonText: String? = nil, reverseFirstButtonColor: Bool = false, firstButtonAction: (() -> Void)? = nil, secondButtonText: String? = nil, reverseSecondButtonColor: Bool = false, secondButtonAction: (() -> Void)? = nil, thirdButtonText: String? = nil, reverseThirdButtonColor: Bool = false, thirdButtonAction: (() -> Void)? = nil, fourthButtonText: String? = nil, reverseFourthButtonColor: Bool = false, fourthButtonAction: (() -> Void)? = nil) {
        
        self.title = title
        self.subtitle = subtitle
        self.firstButtonText = firstButtonText
        self.reverseFirstButtonColor = reverseFirstButtonColor
        self.firstButtonAction = firstButtonAction
        self.secondButtonText = secondButtonText
        self.reverseSecondButtonColor = reverseSecondButtonColor
        self.secondButtonAction = secondButtonAction
        self.thirdButtonText = thirdButtonText
        self.reverseThirdButtonColor = reverseThirdButtonColor
        self.thirdButtonAction = thirdButtonAction
        self.fourthButtonText = fourthButtonText
        self.reverseFourthButtonColor = reverseFourthButtonColor
        self.fourthButtonAction = fourthButtonAction
        
        self.buttonsAlignment = (thirdButtonText?.isEmpty ?? true) ? .horizontal : .vertical
    }

    var title = ""
    var subtitle = ""
    let firstButtonText: String?
    let reverseFirstButtonColor: Bool
    let firstButtonAction: (() -> Void)?
    let secondButtonText: String?
    let reverseSecondButtonColor: Bool
    let secondButtonAction: (() -> Void)?
    let thirdButtonText: String?
    let reverseThirdButtonColor: Bool
    let thirdButtonAction: (() -> Void)?
    let fourthButtonText: String?
    let reverseFourthButtonColor: Bool
    let fourthButtonAction: (() -> Void)?
    
    private var buttonsAlignment: ButtonsAligment = .horizontal
    
    var body: some View {
        
        VStack(spacing: 12) {
            Text(title)
                .foregroundStyle(Color(uiColor: .label))
                .font(DHLModalHelper.shared.titleFont)
                .multilineTextAlignment(.center)
            
            Text(subtitle)
                .foregroundStyle(Color(uiColor: .label))
                .font(DHLModalHelper.shared.subtitleFont)
                .multilineTextAlignment(.center)
            
            let layout = buttonsAlignment == .horizontal
                    ? AnyLayout(HStackLayout(spacing: 16))
                    : AnyLayout(VStackLayout(spacing: 12))
            
            layout {
                ButtonsView(
                    firstButtonText: firstButtonText, reverseFirstButtonColor: reverseFirstButtonColor, firstButtonAction: firstButtonAction,
                    secondButtonText: secondButtonText, reverseSecondButtonColor: reverseSecondButtonColor, secondButtonAction: secondButtonAction,
                    thirdButtonText: thirdButtonText, reverseThirdButtonColor: reverseThirdButtonColor, thirdButtonAction: thirdButtonAction,
                    fourthButtonText: fourthButtonText, reverseFourthButtonColor: reverseFourthButtonColor, fourthButtonAction: fourthButtonAction
                )
            }
            .padding(.top, 12)
            
            /*
            if buttonsAlignment == .horizontal {
                HStack(spacing: 16) {
                    ButtonsView(firstButtonText: firstButtonText, reverseFirstButtonColor: reverseFirstButtonColor, firstButtonAction: firstButtonAction, secondButtonText: secondButtonText, reverseSecondButtonColor: reverseSecondButtonColor, secondButtonAction: secondButtonAction)
                }
                .padding(.top)
                
            } else {
                VStack(spacing: 12) {
                    ButtonsView(firstButtonText: firstButtonText, reverseFirstButtonColor: reverseFirstButtonColor, firstButtonAction: firstButtonAction, secondButtonText: secondButtonText, reverseSecondButtonColor: reverseSecondButtonColor, secondButtonAction: secondButtonAction)
                }
                .padding(.top)
            }
            */
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color(uiColor: .label).opacity(0.6))
    }
}

private struct ButtonsView: View {
    
    let firstButtonText: String?
    let reverseFirstButtonColor: Bool
    let firstButtonAction: (() -> Void)?
    let secondButtonText: String?
    let reverseSecondButtonColor: Bool
    let secondButtonAction: (() -> Void)?
    let thirdButtonText: String?
    let reverseThirdButtonColor: Bool
    let thirdButtonAction: (() -> Void)?
    let fourthButtonText: String?
    let reverseFourthButtonColor: Bool
    let fourthButtonAction: (() -> Void)?
    
    var body: some View {
        
        if let text = firstButtonText {
            ButtonView(text: text, action: firstButtonAction, reverseColor: reverseFirstButtonColor)
        }
        
        if let text = secondButtonText {
            ButtonView(text: text, action: secondButtonAction, reverseColor: reverseSecondButtonColor)
        }
        
        if let text = thirdButtonText {
            ButtonView(text: text, action: thirdButtonAction, reverseColor: reverseThirdButtonColor)
        }
        
        if let text = fourthButtonText {
            ButtonView(text: text, action: thirdButtonAction, reverseColor: reverseFourthButtonColor)
        }
    }
}

private struct ButtonView: View {
    
    let text: String
    let action: (() -> Void)?
    let reverseColor: Bool
    
    var body: some View {
        Button(action: {
            action?()
            
        }, label: {
            Text(text)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .contentShape(Rectangle())
        })
        .foregroundStyle(reverseColor ? Color(uiColor: .label) : .white)
        .font(DHLModalHelper.shared.buttonsFont)
        .background(reverseColor ? .clear : DHLModalHelper.shared.buttonsColor)
        .if(reverseColor, transform: { view in
            view
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(uiColor: .label), lineWidth: 2))
        })
        .cornerRadius(20)
    }
}

private enum ButtonsAligment {
    case vertical
    case horizontal
}

#Preview {
    
    DHLCustomModal(
        title: "Titulo",
        subtitle: "Subtitulo",
        firstButtonText: "boton 1",
        firstButtonAction: {
            
        },
        secondButtonText: "boton 2",
        reverseSecondButtonColor: true,
        secondButtonAction: {
            
        },
        /*
        thirdButtonText: "boton 3",
        reverseThirdButtonColor: true,
        thirdButtonAction: {
            
        }
        */
    )
    // .preferredColorScheme(.dark)
}

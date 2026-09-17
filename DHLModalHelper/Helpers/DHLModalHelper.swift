//
//  DHLModalHelper.swift
//  iSquadClubs
//
//  Created by Daniel Hernandez on 17/09/2026.
//

import Foundation
import SwiftUI

extension View {
    
    // Se pinta un overlay con la modal que se pasa como parametro
    @ViewBuilder
    func showCustomModal<Modal: View>(_ condition: Bool, @ViewBuilder modal: () -> Modal) -> some View {
        if condition {
            self.overlay {
                modal()
            }
        } else {
            self
        }
    }
    
    // Se pinta un alert custom
    @ViewBuilder
    func showAlert(_ condition: Bool,
                   title: String,
                   subtitle: String,
                   firstButtonText: String? = nil, reverseFirstButtonColor: Bool = false, firstButtonAction: (() -> Void)? = nil,
                   secondButtonText: String? = nil, reverseSecondButtonColor: Bool = false, secondButtonAction: (() -> Void)? = nil,
                   thirdButtonText: String? = nil, reverseThirdButtonColor: Bool = false, thirdButtonAction: (() -> Void)? = nil,
                   fourthButtonText: String? = nil, reverseFourthButtonColor: Bool = false, fourthButtonAction: (() -> Void)? = nil
    ) -> some View {
        
        if condition {
            self.overlay {
                DHLCustomModal(
                    title: title,
                    subtitle: subtitle,
                    firstButtonText: firstButtonText,
                    reverseFirstButtonColor: reverseFirstButtonColor,
                    firstButtonAction: {
                        firstButtonAction?()
                    },
                    secondButtonText: secondButtonText,
                    reverseSecondButtonColor: reverseSecondButtonColor,
                    secondButtonAction: {
                        secondButtonAction?()
                    },
                    thirdButtonText: thirdButtonText,
                    reverseThirdButtonColor: reverseThirdButtonColor,
                    thirdButtonAction: {
                       thirdButtonAction?()
                    },
                    fourthButtonText: fourthButtonText,
                    reverseFourthButtonColor: reverseFourthButtonColor,
                    fourthButtonAction: {
                        fourthButtonAction?()
                    }
                )
            }
        } else {
            self
        }
    }
    
    // Se muestra un "cargando".
    func loading(_ isLoading: Bool) -> some View {
        overlay {
            if isLoading {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .controlSize(.large)
                }
            }
        }
    }
}

// Para mostrar la modal ocupando toda la pantalla. Independientemente del tamaño de la vista desde la que se llama.
public func showFullScreenModal<Content: View>(view: Content) {
    
    WindowOverlay.shared.show {
        ZStack {
            
            Color.black
                .opacity(0.6)
                .ignoresSafeArea()
            
            view
        }
    }
}

// Pueden dar problemas los .alert() de la vista principal, aparecen detras de la modal.
final class WindowOverlay {
    
    static let shared = WindowOverlay()
    
    private var window: UIWindow?
    
    private init() {}
    
    func show<Content: View>(@ViewBuilder content: () -> Content) {
        
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive })
        else {
            return
        }
        
        let window = UIWindow(windowScene: scene)
        
        window.backgroundColor = .clear
        // window.windowLevel = .alert + 1
        window.windowLevel = .normal + 1
        
        let hostingController = UIHostingController(
            rootView: content()
        )
        
        hostingController.view.backgroundColor = .clear
        
        window.rootViewController = hostingController
        window.isHidden = false
        
        self.window = window
    }
    
    func hide() {
        window?.isHidden = true
        window = nil
    }
}

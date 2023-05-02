//
//  RoutringManager.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 1.05.2023.
//

import Foundation
import SwiftUI

final class RoutingManager {
    static let shared = RoutingManager()
    private var window: UIWindow!
    
    func initialize(with window: UIWindow){
        self.window = window
    }
    
    func setRootView<Content: View>(_ view: Content, isNavigationBarHidden: Bool) {
        let hostingView = UIHostingController(rootView: view)
        let navigationController = UINavigationController(rootViewController: hostingView)
        navigationController.isNavigationBarHidden = isNavigationBarHidden
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func push<Content: View>(_ view: Content, isNavigationBarHidden: Bool) {
        guard let topNavigationController = UIApplication.topNavigationController(window.rootViewController) else {
            return
        }
        
        topNavigationController.isNavigationBarHidden = isNavigationBarHidden
        let hostingView = UIHostingController(rootView: view)
        topNavigationController.pushViewController(hostingView, animated: true)
    }
}

extension UIApplication {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
    static var rootViewController: UIViewController? {
        keyWindow?.rootViewController
    }
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
    
    class func topNavigationController(_ viewController: UIViewController? = UIApplication.rootViewController) -> UINavigationController? {
        
        if let nav = viewController as? UINavigationController {
            return nav
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                if let navCon = selected as? UINavigationController {
                    return navCon
                } else {
                    return selected.navigationController
                }
            }
        }
        return viewController?.navigationController
    }
}


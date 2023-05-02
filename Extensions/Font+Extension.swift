//
//  Font+Extension.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 1.05.2023.
//

import Foundation
import SwiftUI

extension Font {
    static func mediumFont(_ size: CGFloat) -> Font{
        return Font.custom("Poppins-Medium", size: size)
    }
    
    static func semiBoldFont(_ size: CGFloat) -> Font{
        return Font.custom("Poppins-SemiBold", size: size)
    }
    
    static func regularFont(_ size: CGFloat) -> Font{
        return Font.custom("Poppins-Regular", size: size)
    }
    
    static func boldFont(_ size: CGFloat) -> Font{
        return Font.custom("Poppins-Bold", size: size)
    }
}

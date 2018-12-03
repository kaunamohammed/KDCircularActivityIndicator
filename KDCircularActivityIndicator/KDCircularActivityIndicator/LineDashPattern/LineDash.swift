//
//  LineDash.swift
//  KDCircularActivityIndicator
//
//  Created by Kauna Mohammed on 03/12/2018.
//  Copyright © 2018 Kauna Mohammed. All rights reserved.
//

import Foundation

public enum LineDash: LineDashPattern {
    case none
    case zeroTwoZero
    case fourFourTwo
    
    public var dashPattern: [NSNumber]? {
        switch self {
        case .none: return nil
        case .zeroTwoZero: return ZeroTwoZeroPattern().dashPattern
        case .fourFourTwo: return FourFourTwoPattern().dashPattern
        }
    }
}

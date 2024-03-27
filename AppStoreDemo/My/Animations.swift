//
//  Animations.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/26.
//

import Foundation
import SwiftUI

extension Animation {
    static var openCard: Animation {.spring(response: 0.5, dampingFraction: 0.6)}
    static var closeCard: Animation {.spring(response: 0.6, dampingFraction: 0.8)}
}

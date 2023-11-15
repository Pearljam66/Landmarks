//
//  Profile.swift
//  Landmarks
//
//  Created by Sarah Clark on 11/15/23.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "Sarah")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "💐"
        case summer = "🏖️"
        case autumn = "🍁"
        case winter = "☃️"

        var id: String { rawValue }
    }

}

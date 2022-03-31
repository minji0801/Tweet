//
//  UserDefaultsManager.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getTweet() -> [Tweet]
    func setTweet(_ newValue: Tweet)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case tweet
        
        var value: String {
            self.rawValue
        }
    }
    
    func getTweet() -> [Tweet] {
        guard let data = UserDefaults.standard.data(forKey: Key.tweet.value) else { return [] }
        
        return (try? PropertyListDecoder().decode([Tweet].self, from: data)) ?? []
    }
    
    func setTweet(_ newValue: Tweet) {
        var currentTweet: [Tweet] = getTweet()
        currentTweet.insert(newValue, at: 0)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(currentTweet), forKey: Key.tweet.value)
    }
}

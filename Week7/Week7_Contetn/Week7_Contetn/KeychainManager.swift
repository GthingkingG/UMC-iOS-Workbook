//
//  KeychainManager.swift
//  Week7_Contetn
//
//  Created by Air on 8/2/25.
//

import Foundation
import Security

final class KeychainManager: @unchecked Sendable {
    static let standard = KeychainManager()
    
    private init() {}
    
    public func saveSession(_ session: UserInfo, for key: String) -> Bool {
        guard let data = try? JSONEncoder().encode(session) else { return false }
        return save(data, for: key)
    }
    
    public func loadSession(for key: String) -> UserInfo? {
        guard let data = load(key: key), let session = try? JSONDecoder().decode(UserInfo.self, from: data) else { return nil }
        return session
    }
    
    public func deleteSession(for key: String) {
        _ = delete(key: key)
    }
    
    @discardableResult
    private func save(_ data: Data, for key: String) -> Bool {
        if load(key: key) != nil {
            _ = delete(key: key)
        }
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data,
            kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("Keychain Save Failed: \(status) - \(SecCopyErrorMessageString(status, nil) ?? "Unknown error" as CFString)")
        }
        
        return status == errSecSuccess
    }
    
    private func load(key: String) -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status != errSecSuccess {
            print("Keychain Load Failed: \(status) - \(SecCopyErrorMessageString(status, nil) ?? "Unknown error" as CFString)")
        }
        
        return item as? Data
    }
    
    @discardableResult
    private func delete(key: String) -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess && status != errSecItemNotFound {
            print("Keychain Delete Failed: \(status) - \(SecCopyErrorMessageString(status, nil) ?? "Unknown error" as CFString)")
        }
        
        return status == errSecSuccess
    }
}

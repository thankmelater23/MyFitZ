//
//  ValuablesManager.swift
//  MyFitZ
//
//  Manages password protection settings for the Valuables section.
//

import Foundation
import LocalAuthentication

/// Manages authentication and protection settings for the Valuables category.
/// Users can optionally enable password/biometric protection for their valuables.
class ValuablesManager {
    
    static let shared = ValuablesManager()
    
    private let isProtectionEnabledKey = "valuables_protection_enabled"
    
    private init() {}
    
    /// Whether password protection is enabled for the Valuables section
    var isProtectionEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: isProtectionEnabledKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: isProtectionEnabledKey)
            log.info("Valuables protection enabled: \(newValue)")
        }
    }
    
    /// Checks if biometric authentication (Face ID / Touch ID) is available
    var isBiometricAvailable: Bool {
        let context = LAContext()
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
    
    /// Returns the type of biometric available (Face ID, Touch ID, or none)
    var biometricType: BiometricType {
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }
        
        if #available(iOS 11.0, *) {
            switch context.biometryType {
            case .faceID:
                return .faceID
            case .touchID:
                return .touchID
            default:
                return .none
            }
        } else {
            return .touchID
        }
    }
    
    /// Authenticates the user using biometrics or device passcode
    /// - Parameters:
    ///   - reason: The reason displayed to the user for authentication
    ///   - completion: Called with success/failure result
    func authenticate(reason: String = "Authenticate to access your Valuables", completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        // Use deviceOwnerAuthentication to allow both biometric and passcode fallback
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authError in
                DispatchQueue.main.async {
                    if success {
                        log.info("Valuables authentication successful")
                    } else {
                        log.warning("Valuables authentication failed: \(authError?.localizedDescription ?? "Unknown error")")
                    }
                    completion(success, authError)
                }
            }
        } else {
            log.error("Device authentication not available: \(error?.localizedDescription ?? "Unknown error")")
            DispatchQueue.main.async {
                completion(false, error)
            }
        }
    }
    
    /// Toggles password protection for the Valuables section
    /// When enabling, authenticates first to confirm user identity
    func toggleProtection(completion: @escaping (Bool) -> Void) {
        if isProtectionEnabled {
            // Turning off - require authentication first
            authenticate(reason: "Authenticate to disable Valuables protection") { [weak self] success, _ in
                if success {
                    self?.isProtectionEnabled = false
                    completion(true)
                } else {
                    completion(false)
                }
            }
        } else {
            // Turning on - authenticate to confirm user can authenticate
            authenticate(reason: "Authenticate to enable Valuables protection") { [weak self] success, _ in
                if success {
                    self?.isProtectionEnabled = true
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}

/// Types of biometric authentication available
enum BiometricType {
    case none
    case touchID
    case faceID
    
    var displayName: String {
        switch self {
        case .none:
            return "Passcode"
        case .touchID:
            return "Touch ID"
        case .faceID:
            return "Face ID"
        }
    }
}

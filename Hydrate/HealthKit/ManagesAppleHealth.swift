protocol ManagesAppleHealth {
    typealias CompletionHandler = (Bool, Error?) -> Void

    func requestAuthorizationIfNeeded(completion: @escaping CompletionHandler)
    func recordWaterIntake(_ milliliters: Int, completion: @escaping CompletionHandler)
    func recordCaffeineIntake(_ milligrams: Int, completion: @escaping CompletionHandler)
}

enum HealthKitManagerError: Error {
    case failedToRequestAuthorization
    case failedToSaveSample
    }

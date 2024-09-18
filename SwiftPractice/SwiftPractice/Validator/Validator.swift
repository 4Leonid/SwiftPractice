final class Validator {
  
  // MARK: - Validate Email
  static func validateEmail(login: String?) -> Bool {
    guard
      let login = login,
      !login.isEmpty,
      login == Constants.login
    else {
      return false
    }
    return true
    
    //    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    //    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    //    return emailPredicate.evaluate(with: email)
  }
  
  // MARK: - Validate Password Strength
  static func validatePassword(password: String?) -> Bool {
    guard
      let password = password,
        !password.isEmpty,
      password == Constants.password
    else {
      return false
    }
    return true
    //    // Password rules: At least 8 characters, 1 capital letter, 1 number
    //    let passwordRegEx = "(?=.*[A-Z])(?=.*[0-9]).{8,}"
    //    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
    //    return passwordPredicate.evaluate(with: password)
  }
}


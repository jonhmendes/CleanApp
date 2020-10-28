import Foundation

protocol AddAccount {
    func add(addAccountModel:AddAccountModel, completion: @escaping (Result<AddAccountModel, Error>) -> Void)
    
}
struct AddAccountModel {
    var name: String
    var email: String
    var password :String
    var passwordConfirmation :String
}


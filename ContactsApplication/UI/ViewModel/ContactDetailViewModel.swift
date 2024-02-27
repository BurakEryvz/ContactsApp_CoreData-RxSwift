//
//  ContactDetailViewModel.swift
//  ContactsApplication
//
//  Created by Burak Eryavuz on 23.02.2024.
//

import Foundation
import RxSwift

class ContactDetailViewModel {
    
    var contactsDaoRepository = ContactsDaoRepository()
    
    func updateContact(contact: ContactModel, contact_name: String, contact_number: String) {
        contactsDaoRepository.updateContact(contact: contact, contact_name: contact_name, contact_number: contact_number)
        
        print("<<<--- Updated Contact --->>>")
        print("Updated Contact Name     : \(contact_name)")
        print("Updated Contact Number   : \(contact_number)")
        
    }
    
}

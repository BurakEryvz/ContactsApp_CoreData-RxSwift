//
//   HomepageViewModel.swift
//  ContactsApplication
//
//  Created by Burak Eryavuz on 23.02.2024.
//

import Foundation
import RxSwift

class HomepageViewModel {
    
    var contactsDaoRepository = ContactsDaoRepository()
    var contactsList = BehaviorSubject<[ContactModel]>(value: [ContactModel]())
    
    init() {
        loadContacts()
        self.contactsList = contactsDaoRepository.contactsList
    }
    
    func remove(contact: ContactModel) {
        contactsDaoRepository.remove(contact: contact)
    }
    
    func search(searchText: String) {
        contactsDaoRepository.search(searchText: searchText)
    }
    
    func loadContacts() {
        contactsDaoRepository.loadContacts()
    }
    
}

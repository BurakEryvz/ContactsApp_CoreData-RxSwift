//
//  ContactsDaoRepository.swift
//  ContactsApplication
//
//  Created by Burak Eryavuz on 23.02.2024.
//

import Foundation
import RxSwift
import CoreData

class ContactsDaoRepository {
     
    var contactsList = BehaviorSubject<[ContactModel]>(value: [ContactModel]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    func saveContact(contact_name: String, contact_number: String) {
        let contact = ContactModel(context: context)
        contact.contact_name = contact_name
        contact.contact_number = contact_number
        
        appDelegate.saveContext()
        
    }
    
    func updateContact(contact: ContactModel, contact_name: String, contact_number: String) {
        contact.contact_name = contact_name
        contact.contact_number = contact_number
        
        appDelegate.saveContext()
    }
    
    func remove(contact: ContactModel) {
        context.delete(contact)
        appDelegate.saveContext()
        loadContacts()
    }
    
    func search(searchText: String) {
        do {
            let fr = ContactModel.fetchRequest()
            fr.predicate = NSPredicate(format: "contact_name CONTAINS[c] %@", searchText)
            let list = try context.fetch(fr)
            contactsList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }

    }
    
    func loadContacts() {
        
        do {
            let list = try context.fetch(ContactModel.fetchRequest())
            contactsList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

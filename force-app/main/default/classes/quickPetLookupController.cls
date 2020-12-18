
//without sharing if it's an external page, but it may be safer to use sharing settings!
public without sharing class quickPetLookupController {
    public List<Pet__c> pets {get;set;} // this will store the list of pet records
    public List<SelectOption> petOptions {get;set;} //this will be a list of pets that the user can select
    public String petId{get;set;} //this will be the selected pet's id
    public Pet__c pet {get;set;} //this will be the selected pet
    
    public quickPetLookupController() {
        //get the list of pets
        pets = new List<Pet__c>([SELECT Id, Name, Account__r.Name, Pet_Image__c FROM Pet__c]);

        //default selection to first pet in the list
        petId = pets[0].Id;
        pet = pets[0];
        //put each pet into a SelectOption list, this will be used in the dropdown
        petOptions = new List<SelectOption>();      //instantiates the list of SelectOptions
        for(Pet__c p : pets){
            //each selection has the id as the value, and the pet's name with the account name as the display label
            petOptions.add(new SelectOption(p.Id, p.Name+' (from '+p.Account__r.Name+')'));
        }
    }

    public void selectPet(){
        //the user has selected a new pet and the dropdown (selectlist) returns an id, so we have to requery it with the fields that we want to show
        pet = [SELECT Id, Name, Account__r.Name, Pet_Image__c FROM Pet__c WHERE Id=:petId];
    }
}

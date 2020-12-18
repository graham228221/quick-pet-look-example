@isTest
public class quickPetLookupControllerTest {
    @isTest
    public static void quickPetLookupControllerTest() {
        //create an account
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        //add a pet
        Pet__c pet = new Pet__c(
            Account__c = acc.Id,
            Image_URL__c = 'https://www.example.com'
        );
        insert pet;

        Test.startTest();
        //instantiate the controller
        quickPetLookupController controller = new quickPetLookupController();
        //check that the test pet was picked up
        controller.petId = pet.Id;

        //select a pet to test the controller method
        controller.selectPet();
    }
}

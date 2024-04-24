/**
 * @description       : Class to handle service from House object
 * @author            : Nicolas Londoño
 * @last modified on  : 04-24-2024
 * @last modified by  : Nicolas Londoño
**/
public with sharing class HouseService {
    /**
    * @description method to get 10 houses
    * @author Nicolas Londoño | 04-24-2024 
    * @return List<House__c> 
    **/
    @AuraEnabled(cacheable=true)
    public static List<House__c> getRecords() { 
        try {
            // Create a list of House records from a SOQL query
            List<House__c> lstHouses = [
                SELECT
                   Id,
                   Name,
                   Address__c,
                   State__c, 
                   City__c,
                   Zip__c
                   FROM House__c
                   WITH USER_MODE
                   ORDER BY CreatedDate
                   LIMIT 10
                ];
                  return lstHouses;
        }
        // Code to handle exception
        catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
        }
    }
}  
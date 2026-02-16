/**
 * Handler for Account trigger.
 * Central place for setting Account field values by condition.
 * Add or extend conditions in setValuesForAccountByCondition() as needed.
 */
public with sharing class AccountTriggerHandler {

    /**
     * Single entry from trigger. Decides insert vs update and runs the right logic.
     */
    public static void run() {
        if (!Trigger.isBefore) {
            return;
        }
        if (Trigger.isInsert || Trigger.isUpdate) {
            setValuesForAccountByCondition(Trigger.new);
        }
        // Add after insert/update branches here if needed
    }

    /**
     * Sets Account field values based on conditions.
     * E.g. Rating 'Warm' -> Industry 'Apparel'; other Rating -> Industry 'Agriculture'.
     * Others can add more conditions here for reuse.
     */
    private static void setValuesForAccountByCondition(List<Account> accounts) {
        for (Account acc : accounts) {
            // Rating -> Industry
            if (acc.Rating == 'Warm') {
                acc.Industry = 'Apparel';
            } else if (acc.Rating != null) {
                acc.Industry = 'Agriculture';
            }
            // Add more conditions below as needed
        }
    }
}

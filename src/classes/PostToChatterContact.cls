public class PostToChatterContact {
    public static void postChatterContact(List<Contact> newContacts) {
        // This test if the trigger is being called 
        System.debug('postChatterContact is starting');
        
        // loop contact to verify each entry
        for (Contact c : newContacts) {
            if (c.email == 'null') {
                // checking if the email is empty and return error
                System.debug('Contact with Last Name: ' + c.LastName + ' did not have an email specified');
            } else {
                ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(), c.Id, ConnectApi.FeedElementType.FeedItem, 'Email this Person.');
            }
        }
        
        System.debug('postChatter is ending');
        
        // ** Testing Code **
        // Contact c1 = new Contact(LastName = 'Joestar', Email = 'this@email.com');
        // Contact c2 = new Contact(LastName = 'Dio', Email = 'this@email.com');
        // Contact c3 = new Contact(LastName = 'Dion', Email = 'this@email.com');

        // List<Contact> conList = new List<Contact> {c1, c2, c3};
        // insert conList;
    }
}
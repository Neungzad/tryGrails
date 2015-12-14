package gso

class Vote {

    Integer vote
    Date    dateCreated
    Date    lastUpdated

    static belongsTo = [comment: Comment, user: User]
    
    static constraints = {
    }
}

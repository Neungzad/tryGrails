package gso

class Vote {

    Integer vote
    Date    dateCreated
    User 	voter

    static belongsTo = [comment: Comment]
    
    static constraints = {

    }
}

package gso

class Comment {

    String  comment
    Integer voteScore = 0 
    CommentStatus  isRightAnswer = CommentStatus.NO
    Date    dateCreated
    User    creator
    Date    lastUpdated
    User    updater

    static belongsTo = [question: Question]
    // static hasMany = [votes: Vote]

    static constraints = {
    	comment nullable:false, blank:false
        dateCreated nullable: true
        lastUpdated nullable: true
        creator nullable: true
        updater nullable: true
    }

    static mapping = {
    	comment(type: "text")        
    }

    enum CommentStatus {
    	YES, NO
    }
}

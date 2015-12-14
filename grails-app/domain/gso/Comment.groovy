package gso

class Comment {

    String  comment
    Integer voteScore = 0 
    CommentStatus  isRightAnswer = CommentStatus.NO
    Date    dateCreated
    Date    lastUpdated

    static belongsTo = [question: Question, user: User]
    static hasMany = [votes: Vote]

    static constraints = {
    	comment(nullable:false, blank:false)
    }

    static mapping = {
    	comment(type: "text")
    }

    enum CommentStatus {
    	YES, NO
    }
}

package gso

class Question {

    String  subject
    String  content
    Integer voteScore = 0
    Integer viewCount = 0
    QuestionStatus  status = QuestionStatus.ACTIVE
    Date    dateCreated
    User    creator
    Date    lastUpdated
    User    updater

    static belongsTo = [category: Category]
    static hasMany = [comments: Comment]

    static constraints = {
        subject(nullable:false, blank:false)
        content(nullable:false, blank:false)        
    }
    
    static mapping = {
        content(type: "text")
        category(fetch: 'join')  
    }

    enum QuestionStatus {
        ACTIVE, DELETED
    }
}


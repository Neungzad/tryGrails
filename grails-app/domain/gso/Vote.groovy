package gso

class Vote {

    Integer  vote
    Date     dateCreated
    User 	 voter
    Comment  comment
    Question question

    //static belongsTo = [comment: Comment]
    
    static constraints = {
    	comment nullable:true
    	question nullable:true        
    }
}

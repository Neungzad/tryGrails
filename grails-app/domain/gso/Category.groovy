package gso

class Category {

    String name

    static hasMany = [questions: Question]

    static constraints = {
    }

    String toString() {	"${name}" }
    
}

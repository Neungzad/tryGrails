package gso

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 3, 100)
        // params.fetch = [category:'join']

        /*def user = springSecurityService.currentUser
        println "============== user : ${user.displayName} ================="*/

       /*        
        println "param : ${params}"
        println "params.subjectContains : ${params.subjectContains}"
        // println "params.category : ${params.category}"*/
        
        def questionInstanceList = Question.createCriteria().list(params){
            eq('status', Question.QuestionStatus.ACTIVE)
            if (params.subjectContains) ilike('subject', "%${params.subjectContains.trim()}%")
            if (params.categoryId) eq('category.id', params.categoryId.toLong())                      
        }        

        // def categories = Category.executeQuery("SELECT category_id, count('category_id') as cateCount FROM question GROUP BY category_id")
        def categories = Question.executeQuery("select category, count(*) from Question group by category_id")

        respond questionInstanceList, model:[questionInstanceCount: questionInstanceList.totalCount, categories: categories]
    }

    def show(Question questionInstance) {
        respond questionInstance
    }

    def create() {
        respond new Question(params)
    }

    @Transactional
    def save(Question questionInstance) {
        if (questionInstance == null) {
            notFound()
            return
        }

        if (questionInstance.hasErrors()) {
            respond questionInstance.errors, view:'create'
            return
        }

        questionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
                redirect questionInstance
            }
            '*' { respond questionInstance, [status: CREATED] }
        }
    }

    def edit(Question questionInstance) {
        respond questionInstance
    }

    @Transactional
    def update(Question questionInstance) {
        if (questionInstance == null) {
            notFound()
            return
        }

        if (questionInstance.hasErrors()) {
            respond questionInstance.errors, view:'edit'
            return
        }

        questionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
                redirect questionInstance
            }
            '*'{ respond questionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Question questionInstance) {

        if (questionInstance == null) {
            notFound()
            return
        }

        questionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

class QuestionSearchCmd {
    String subjectContains
    Category category
}

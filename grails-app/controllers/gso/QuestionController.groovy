package gso

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 3, 100)
        // params.fetch = [category:'join']
        
        def questionInstanceList = Question.createCriteria().list(params){
            eq('status', Question.QuestionStatus.ACTIVE)
            if (params.subjectContains) ilike('subject', "%${params.subjectContains.trim()}%")
            if (params.categoryId) eq('category.id', params.categoryId.toLong())                      
        }        

        def categories = Question.executeQuery("select category, count(*) from Question group by category_id")

        respond questionInstanceList, model:[questionInstanceCount: questionInstanceList.totalCount, categories: categories]
    }

    def show(Question questionInstance) {
        respond questionInstance
    }

    @Secured('ROLE_USER')
    def create() {
        respond new Question(params)
    }

    @Transactional
    @Secured('ROLE_USER')
    def save(Question questionInstance) {
        if (questionInstance == null) {
            notFound()
            return
        }

        questionInstance.user = springSecurityService.currentUser
        println "${springSecurityService.currentUser}";

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

    @Secured('ROLE_USER')
    def edit(Question questionInstance) {
        respond questionInstance
    }

    @Transactional
    @Secured('ROLE_USER')
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
    @Secured('ROLE_USER')
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

/*class QuestionSearchCmd {
    String subjectContains
    Category category
}*/

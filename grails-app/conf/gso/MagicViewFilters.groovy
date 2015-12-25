package gso



class MagicViewFilters {

    def filters = {
        all(controller:'*', action:'*') {           
            after = { Map model ->
                def gsoService = grailsApplication.mainContext.getBean('gsoService')

                if (!request['currentUser']) {
                    request['currentUser'] = gsoService.currentUser
                }
            }
        }
    }
}

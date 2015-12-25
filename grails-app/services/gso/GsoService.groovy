package gso

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*

@Transactional
class GsoService {

	def springSecurityService

	/**
   * ดึงข้อมูลของ User ปัจจุบันที่เข้าใช้ระบบ
   * @return
   */
    def getCurrentUser() {
    	return springSecurityService.isLoggedIn() ? springSecurityService.loadCurrentUser() : null
    }
}

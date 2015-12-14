import gso.Role
import gso.User
import gso.UserRole
import gso.Category

class BootStrap {

    def init = { servletContext ->
		def adminRole = new Role('ROLE_ADMIN').save()
		def userRole = new Role('ROLE_USER').save()
		def testUser = new User('admin', '1234', 'Neung', 'neungszad@gmail.com').save()
		UserRole.create(testUser, adminRole, true)

		assert User.count() == 1
		assert Role.count() == 2
		assert UserRole.count() == 1

		new Category(name: 'Java').save(failOnError: true)
		new Category(name: 'PHP').save(failOnError: true)
		new Category(name: 'Scala').save(failOnError: true)
    }

    def destroy = {
    }
}

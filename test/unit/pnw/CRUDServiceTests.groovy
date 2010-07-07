package pnw

import grails.test.*

class CRUDServiceTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testCreateUser() {
		def userDatabase = []
		mockDomain(User,userDatabase)
		mockLogging(CrudService,true)
		def service = new CrudService()
		def tuple = service.createUser("fulano","fulano@email.com")
		assert tuple[0] == true
		assert tuple[1] != null
    }
}

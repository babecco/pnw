class BootStrap {

	def crudService

    def init = { servletContext ->
		crudService.createPessoaJuridica("jvob","jvob","joao@babecco.com","24152910000158","Babecco")
		crudService.createPessoaFisica("mab","mab", "mab@cin.ufpe.br","11111111111","Mateus")
		crudService.createCategoria("Informática")
		crudService.createCategoria("Escritório")
		crudService.createCategoria("Linha Branca")
		crudService.createCategoria("Automóveis")
    }
    def destroy = {
    }
}

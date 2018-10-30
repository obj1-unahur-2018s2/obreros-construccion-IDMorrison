object uocra{
	method jornalAlbanil(){
		return 2000
	}
	method jornalEspecBanioYCocina(){
		return 3000
	}
	method jornalElectricista(){
		return 3500
	}
	
}

class Obrero {
	var property estaActivo
	var property diasTrabajados = 0
	const registroObras = []
	method consumir(obra)
	method aporta(obra)
	
	method trabajarUnDia(obra){
		self.consumir(obra)
		self.aporta(obra)
		self.sumarDiaDeTrabajo()
	}
	
	method sumarDiaDeTrabajo(){
		diasTrabajados+=1
	}
	
	method cuantoCobrar()
	
	method registrarObra(obra){
		registroObras.add(obra)
	}
	method pasoPor(obra){
		registroObras.any({elemento => elemento == obra})
	}
}

class Albanil inherits Obrero{
	override method consumir(obra){
		obra.restarLadrillos(100)
	}
	override method aporta(obra){
		obra.levantarPared(3)
	}
	override method cuantoCobrar(){
		return uocra.jornalAlbanil()*diasTrabajados
	}
}

class Gasista inherits Obrero{
	override method consumir(obra){
		obra.restarCanios(3)
		obra.restarFosforos(20)
	}
	override method aporta(obra){
		obra.colocarCaniosGas(3)	
	}
	override method cuantoCobrar(){
		return uocra.jornalEspecBanioYCocina()*diasTrabajados
	}
}

class Plomero inherits Obrero{
	override method consumir(obra){
		obra.restarCanios(10)
		obra.restarArandelas(30)
	}
	override method aporta(obra){
		obra.colocarCaniosAgua(9)	
	}
	override method cuantoCobrar(){
		return uocra.jornalEspecBanioYCocina()*diasTrabajados
	}
}

class Electricista inherits Obrero{
	override method consumir(obra){
		obra.restarMetrosCable(4)
		obra.restarCintaAisladora(1)
	}
	override method aporta(obra){
		obra.colocarMetrosCable(4)	
	}
	override method cuantoCobrar(){
		return uocra.jornalElectricista()*diasTrabajados
	}
}

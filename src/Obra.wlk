class Obra {
	var property anchoTerreno
	var property profundidadTerreno
	
	var property ladrillos = 0
	var property canios = 0
	var property fosforos = 0
	var property arandelas = 0
	var property metrosCable = 0
	var property cintaAisladora = 0
	var property metrosHechosPared = 0
	var property metrosHechosCanioGas = 0
	var property metrosHechosCanioAgua = 0
	var property metrosHechosCable = 0
	var obrerosRegistrados = []
	var property efectivo = 0
	var property cantPisos
	
	
	method agregarObrero(obrero) {
		obrerosRegistrados.add(obrero)
		obrero.registrarObra(self)
	}
	method tieneObrero(tipo){
		return obrerosRegistrados.any({obrero => obrero==tipo})
	}
	
	method obrerosActivos(){
		return obrerosRegistrados.filter({obrero => obrero.estaActivo()}) 
	}
	
	method registrarJornada(){
		self.obrerosActivos().forEach({obrero => obrero.trabajarUnDia(self)})
	}
	
	method totalAdeudado(){
		return obrerosRegistrados.sum({obrero=>obrero.cuantoCobrar()})
	}
	method pagarDeudas(){
		efectivo-=self.totalAdeudado()
		obrerosRegistrados.forEach({obrero=>obrero.diasTrabajados(0)})
	}
	
	method obraFinalizada(){
		return (
			metrosHechosPared>=50*self.cantHabitaciones() and
			metrosHechosCanioGas>=((anchoTerreno+profundidadTerreno)*cantPisos*5) and
			metrosHechosCanioAgua>=180*self.cantBanios() and
			metrosHechosCable>=50*self.cantHabitaciones()+100*cantPisos
		)
	}
	
	method cantHabitaciones()
	method cantBanios()
	
	method recibirLadrillos(cant){
		ladrillos+=cant
	}
	method recibirCanios(cant){
		canios+=cant
	}
	method recibirFosforos(cant){
		fosforos+=cant
	}
	method recibirArandelas(cant){
		arandelas+=cant
	}
	method recibirCable(cant){
		metrosCable+=cant
	}
	method recibirCinta(cant){
		cintaAisladora+=cant
	}
	
	
	method restarLadrillos(cuantos){
		ladrillos-=cuantos
	}
	method restarCanios(cuantos){
		canios-=cuantos
	}
	method restarFosforos(cuantos){
		fosforos-=cuantos
	}
	method restarArandelas(cuantos){
		arandelas-=cuantos
	}
	method restarMetrosCable(cuantos){
		metrosCable-=cuantos
	}
	method restarCintaAisladora(cuantos){
		cintaAisladora-=cuantos
	}
	
	method levantarPared(metros){
		metrosHechosPared+=metros
	}
	method colocarCaniosGas(metros){
		metrosHechosCanioGas+=metros
	}
	method colocarCaniosAgua(metros){
		metrosHechosCanioAgua+=metros
	}
	method colocarCable(metros){
		metrosHechosCable+=metros
	}
}

class Casa inherits Obra{
	var property cantHabitaciones
	var property cantBanios
	
	override method cantHabitaciones(){
		return cantHabitaciones
	}
	
	override method cantBanios(){
		return cantBanios
	}
	
}

class Edificio inherits Obra{
	
	var property dptosPorPiso
	var property habitacionesPorDepto
	var property cantAscensores
	
	override method cantHabitaciones(){
		return cantPisos*dptosPorPiso*habitacionesPorDepto
	}
	override method cantBanios(){
		return habitacionesPorDepto*1
	}
}
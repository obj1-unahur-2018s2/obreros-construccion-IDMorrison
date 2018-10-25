class Obrero {
	var property estaActivo
	var property diasTrabajados = 0
	
	method trabajarUnDia(obra){
		self.consumir(obra)
//		self.aporta(obra)
		self.sumarDiaDeTrabajo()
	}
	
	method consumir(obra)
	method aporta(obra)
	method sumarDiaDeTrabajo(){
		diasTrabajados+=1
	}
}

class Albanil inherits Obrero{
	override method consumir(obra){
		obra.restarLadrillos(100)
	}
	override method aporta(obra){
		obra.levantarPared(3)
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
}

class Plomero inherits Obrero{
	override method consumir(obra){
		obra.restarCanios(10)
		obra.restarArandelas(30)
	}
	override method aporta(obra){
		obra.colocarCaniosAgua(9)	
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
}

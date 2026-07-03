import territorios.*
class Seres{
    method habilidad()

    method esInmortal()

    method adquirirExperiencia()

    method somnolencia()

    method estaConforme(unTerritorio)

    method tomarRecursos(unTerritorio)
}

class Elfo inherits Seres{
    override method esInmortal(){
        return true
    }

    var property cancionesSabidas=20
    //el parámetro "unNumero" tampoco puede ser negativo
    method aprenderCanciones(unNumero){
        cancionesSabidas=cancionesSabidas+unNumero
    }

    method olvidarCanciones(unNumero){
        cancionesSabidas=0.max(cancionesSabidas-unNumero)
    }

    override method habilidad(){
        return if(cancionesSabidas<=60){
            180
        }
        
        else {
            cancionesSabidas*3
        }
    }

    override method adquirirExperiencia(){
        cancionesSabidas=cancionesSabidas*2
    }

    override method somnolencia(){
        self.olvidarCanciones(10)
    }

    override method estaConforme(unTerritorio){
        return unTerritorio.lembas()>8
    }

    override method tomarRecursos(unTerritorio){
        unTerritorio.lembasRobadas()
        self.aprenderCanciones(15)
    }

}

class Hobbit inherits Seres{
    var property cantAmigos=40
    var historiasEscuchadas=6

    method estaDeprimido(){
        return (cantAmigos<20)
    }

    override method esInmortal(){
        return (!self.estaDeprimido())        
    }

    override method habilidad(){
        return if(cantAmigos<60){
            historiasEscuchadas*100
        }
        else{
            historiasEscuchadas*50
        }
    }

    override method adquirirExperiencia(){
        cantAmigos=cantAmigos+8
    }

    method organizarFiesta(){
        cantAmigos=cantAmigos+5
        historiasEscuchadas=historiasEscuchadas+5
    }
    //Ira no puede ser un numero negativo.
    override method somnolencia(){
        cantAmigos=cantAmigos-3
    }

    override method estaConforme(unTerritorio){
        return unTerritorio.seresMejoresQue(self).size()>=2
    }

    override method tomarRecursos(unTerritorio){
        unTerritorio.tabacoRobado()
        cantAmigos=cantAmigos+7
        historiasEscuchadas=historiasEscuchadas+7
    }



}

class Enano inherits Seres{
    var property ira=200 

    override method esInmortal(){
        return false
    }

    override method habilidad(){
        return ira*2
    }

    override method adquirirExperiencia(){
        ira=ira+300
    }
    //Ira no puede ser un numero negativo.
    override method somnolencia(){
        ira=ira-50
    }

    override method estaConforme(unTerritorio){
        return unTerritorio.seresTorpes().size()>=1
    }

    override method tomarRecursos(unTerritorio){

    }
}

class ElfoSilvano inherits Elfo{
    override method habilidad(){
       return super()+400
    }
}

class EnanoHerrero inherits Enano{
    var armasFabricadas=3

    override method habilidad(){
        return armasFabricadas*100
    }

    override method adquirirExperiencia(){
        super()
        armasFabricadas=armasFabricadas+1
    }
}























object cuevaSeres{
    const seresAbajo=[]
    const seresArriba=[]

    method seresTotales(){
        return seresAbajo+seresArriba
    }

    method añadirSerAbajo(unSer){
        seresAbajo.add(unSer)
    }

    method añadirSerArriba(unSer){
        seresArriba.add(unSer)
    }
}
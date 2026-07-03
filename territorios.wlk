import seres.*

class Territorio{
    const property seresEnTerritorio=[]
    var property lembas=10
    var property tabaco=10

    method añadirSerATerritorio(unSer){
        seresEnTerritorio.add(unSer)
    }

    method seresMejoresQue(unSer){
       return seresEnTerritorio.filter({c=>c.habilidad()>unSer.habilidad()})
    }

    method seresTorpes(){
        return seresEnTerritorio.filter({c=>c.habilidad()<1000})
    }

    method valorMaximoHabilidad(){
        return seresEnTerritorio.max({c=>c.habilidad()}).habilidad()
    }

    method promedioHabilidad(){
        return seresEnTerritorio.sum({c=>c.habilidad()})/self.numeroSeresTerritorio()
    }
    method numeroSeresTerritorio(){
        return seresEnTerritorio.size()
    }

    method esTerritorioSabio(){
        return seresEnTerritorio.all({c=>c.habilidad()>300})
    }

    method huboTorneo(){
        seresEnTerritorio.forEach({c=>c.adquirirExperiencia()})
    }

    method huboEpifania(){
        self.seresTorpes().forEach({c=>c.adquirirExperiencia()})
    }

    method haySerMortal(){
        return !seresEnTerritorio.any({c=>c.esInmortal()})
    }

    method estaEnPaz(){
        return seresEnTerritorio.all({c=>c.estaConforme()})
    }

    method lembasRobadas(){
        lembas=lembas-3
    }

    method tabacoRobado(){
        tabaco=tabaco-4
    }

}











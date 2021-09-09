require_relative 'participantes' 
require_relative 'equipo'

   
class Torneo
  
    def initialize()
      @equipos = Array.new
      @participantes = Array.new
    end
    
    def obtenerEquipo(codigo,nombre)
      for equipo in @equipos
        if equipo.codigo == codigo
          return equipo
        end
      end
      return nil
    end
    
    def registrarEquipo(codigo, nombre)
      equipo = obtenerEquipo(codigo, nombre)
      if equipo == nil
        equipo = Equipo.new(codigo, nombre)
        @equipos.push(equipo)
      end
    end
    
    def registrarParticipante(codigo, nombre, edad, dni, colorCinturon, partidasGanadas, partidasPerdidas, partidasEmpatadas, codEquipo)
      equipo = obtenerEquipo(codEquipo)
      if equipo != nil 
        participantes = Participantes.new(codigo, nombre, edad, dni, colorCinturon, partidasGanadas, partidasPerdidas, partidasEmpatadas)
        equipo.participantes.push(participantes)
        @participantes.push(participantes)
      else
        puts "Equipo no encontrado"
      end
    end
    
    def obtenerParticipantes(dni) 
        for participantes in @participantes
          if participantes.dni == dni
            return participantes
          end
        end
        return nil
    end  
    
    def actualizarPartidasGanadas(dni, partidasGanadas)
      participante = obtenerParticipante(dni)
      if participante != nil
        participante.partidasGanadas = partidasGanadas
        participante.nuevoPuntaje()
      else
        puts "Participante no encontrado"
      end
    end
    
    def ganador()
      maxPuntaje = 0
      campeon = nil
      for participantes in @participantes
        if participantes.puntaje > maxPuntaje
          maxPuntaje = participantes.puntaje
          campeon = participantes
        end
      end
      return campeon
    end
    
    def tablaPosiciones()
      posiciones = []
      for participantes in @participantes
        posiciones.push(participantes)
      end
      
      for i in 0...posiciones.count
        for j in i+1...posiciones.count
          participanteA = posiciones[i]
          participanteB = posiciones[j]
          if participanteA.puntaje < participanteB.puntaje
            temporal = participanteA
            posiciones[i] = participanteB
            posiciones[j] = temporal
          end
        end
      end
      
      for i in 0...posiciones.count
        participantes = posiciones[i]
        puts "#{i+1}° lugar:"
        print " "
        imprimirInfoParticipante(participantes)
      end
    end
    
    def listarEquipos()
      for equipo in @equipos
        imprimirInfoEquipo(equipo)
        totalPuntaje = 0
        for participantes in equipo.participantes
          totalPuntaje = totalPuntaje + participante.puntaje
        end
        puts " Puntaje total: #{totalPuntaje}"
      end
    end
    
    def imprimir_info_equipo(equipo)
      if equipo == nil
        return
      end
      puts "Equipo: #{equipo.nombre}"
    end
    
    def imprimirInfoParticipantes(participantes)
      if participantes == nil
        return
      end
      puts "Participante: #{participantes.dni} - #{participantes.nombre} de #{participantes.edad} años. Puntaje actual : #{participante.puntaje}"   
      # puts "    PG: #{participante.partidasGanadas}"
    end
    
  end


torneo = Torneo.new
torneo.registrarEquipo('EQ01', "Karatecas Kids")
torneo.registrarEquipo("EQ02", "Karatecas de Surco")
torneo.registrarEquipo("EQ03", "Karatecas de Miraflores")
torneo.registrarEquipo("EQ04", "Karatecas de San Miguel")
torneo.registrarEquipo("EQ05", "Karatecas de San Borja")
torneo.registrarEquipo("EQ06", "Karatecas de La Molina")
torneo.registrarParticipante("COD01", "Jose Torres", 29, "46531738", "verde", 2, 4, 4, "EQ02")
torneo.registrarParticipante("COD02", "Emilio Verastegui", 30, "46531740", "verde", 0, 4, 2, "EQ02")
torneo.registrarParticipante("COD03", "Lorenzo Puente", 31, "46531742", "verde", 0, 4, 1, "EQ02")
torneo.registrarParticipante("COD04", "Ricardo Rivero", 12, "53173800", "amarillo", 1, 2, 0, "EQ01")
torneo.registrarParticipante("COD05", "Carlos Herrera", 25, "65331738", "marron", 10, 5, 0, "EQ03")  

# a
participanteA = torneo.obtenerParticipante("46531738")
torneo.imprimirInfoParticipante(participanteA)
# b
ganadorTorneo = torneo.ganador()
torneo.imprimirInfoParticipante(ganadorTorneo)
# c
torneo.actualizarPartidasGanadas("53173800", 30)
participanteB = torneo.obtenerParticipante("53173800")
torneo.imprimirInfoParticipante(participanteB)
#d
puts
torneo.tablaPosiciones()
#e
puts
torneo.listarEquipos()
  
  
  
  
  

  
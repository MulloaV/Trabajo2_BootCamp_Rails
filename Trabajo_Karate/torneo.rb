require_relative 'participantes'
require_relative 'equipo'

   
class Torneo
  
    def initialize()
      @equipos = Array.new
      @participantes = Array.new
    end
    
    def obtener_equipo(codigo)
      for equipo in @equipos
        if equipo.codigo == codigo
          return equipo
        end
      end
      return nil
    end
    
    def registrar_equipo(codigo, nombre)
      equipo = obtener_equipo(codigo)
      if equipo == nil
        equipo = Equipo.new(codigo, nombre)
        @equipos.push(equipo)
      end
    end
    
    def registrar_participante(codigo, nombre, edad, dni, colorCinturon, partidasGanadas, partidasPerdidas, partidasEmpatadas, codEquipo)
      equipo = obtener_equipo(codEquipo)
      if equipo != nil 
        participante = Participante.new(codigo, nombre, edad, dni, colorCinturon, partidasGanadas, partidasPerdidas, partidasEmpatadas)
        equipo.participantes.push(participante)
        @participantes.push(participante)
      else
        puts "Equipo no encontrado"
      end
    end
    
    def obtener_participante(dni) 
        for participante in @participantes
          if participante.dni == dni
            return participante
          end
        end
        return nil
    end  
    
    def actualizar_partidas_ganadas(dni, partidasGanadas)
      participante = obtener_participante(dni)
      if participante != nil
        participante.partidasGanadas = partidasGanadas
        participante.recalcular_puntaje()
      else
        puts "Participante no encontrado"
      end
    end
    
    def ganador()
      maxPuntaje = 0
      campeon = nil
      for participante in @participantes
        if participante.puntaje > maxPuntaje
          maxPuntaje = participante.puntaje
          campeon = participante
        end
      end
      return campeon
    end
    
    def tabla_posiciones()
      posiciones = []
      for participante in @participantes
        posiciones.push(participante)
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
        participante = posiciones[i]
        puts "#{i+1}° lugar:"
        print " "
        imprimir_info_participante(participante)
      end
    end
    
    def listar_equipos()
      for equipo in @equipos
        imprimir_info_equipo(equipo)
        totalPuntaje = 0
        for participante in equipo.participantes
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
    
    def imprimir_info_participante(participante)
      if participante == nil
        return
      end
      puts "Participante: #{participante.dni} - #{participante.nombre} de #{participante.edad} años. Puntaje actual : #{participante.puntaje}"   
      # puts "    PG: #{participante.partidasGanadas}"
    end
    
  end




  
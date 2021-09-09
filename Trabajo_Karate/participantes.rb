class Participantes #{}< Torneo
    
	attr_accessor :codigo, :nombre, :edad, :dni, :colorCinturon, :partidasGanadas, :partidasEmpatadas, :partidasPerdidas, :codEquipo
	def initialize codigo, nombre, edad, dni, colorCinturon,partidasGanadas, partidasEmpatadas, partidasPerdidas, codEquipo
		@codigo = codigo
        @nombre = nombre
		@edad = edad
		@dni = dni
		@colorCinturon = colorCinturon
		@partidasGanadas = partidasGanadas
		@partidasEmpatadas = partidasEmpatadas
		@partidasPerdidas = partidasPerdidas
		@codEquipo = codEquipo
        @puntaje =  (@partidasGanadas) * 4 + (@partidasEmpatadas) * 3
	end

	def nuevoPuntaje
		@puntaje = (@partidasGanadas) * 4 + (@partidasEmpatadas) * 3
	end

	def torneo
		
	end
end    
class Participantes
    
	attr_accessor :codigo, :nombre, :edad, :dni, :colorCinturon, :partidasGanadas, :partidasEmpatadas, :partidasPerdidas
	def initialize codigo, nombre, edad, dni, colorCinturon,partidasGanadas, partidasEmpatadas, partidasPerdidas
		@codigo= codigo
        @nombre = nombre
		@edad = edad
		@dni = dni
		@colorCinturon = colorCinturon
		@partidasGanadas = partidasGanadas
		@partidasEmpatadas = partidasEmpatadas
		@partidasPerdidas = partidasPerdidas
        @puntaje =  (@partidasGanadas) * 4 + (@partidasEmpatadas) * 3
	end

	def nuevoPuntaje
		@puntaje = (@partidasGanadas) * 4 + (@partidasEmpatadas) * 3
	end
end    
require_relative 'Participantes'

class Equipo
    attr_accessor :codigo, :nombre, :participantes
    def initialize(codigo, nombre)
        @codigo = codigo
        @nombre = nombre
        @participantes = Array.new #codigo, nombre
    end
end

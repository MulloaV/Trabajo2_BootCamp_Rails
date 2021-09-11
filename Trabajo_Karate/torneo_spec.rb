require_relative 'equipo'
require_relative 'participantes'
require_relative 'torneo'

RSpec.describe Torneo do
    context "Initialize class Torneo" do
        before(:each) do
            @torneo = Torneo.new  #"COD01", "Jose Torres", 29, "46531738", "verde", 2, 4, 4, "Equipo02"
        end

        it 'Nuevo' do        
            expect(@torneo).to be_an_instance_of(Torneo)
        end
    end   


    context 'validacionRegistros' do
        it 'registrarEquipos' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            expect(@torneo.equipos[0]).to have_attributes(codigo: 'EquipoAlfa')
        end

        it 'registrarParticipante' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            expect(@torneo.participantes[0]).to have_attributes(nombre: 'Juan Carlos')
        end
    end
    context 'validacionObtencion' do
        it 'obtenerEquipos' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.obtenerEquipo 'EquipoAlfa', 'Prueba01'
            expect(@torneo.equipos[0]).to have_attributes(codigo: 'EquipoAlfa')
        end
        it 'obtenerParticipante' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            @torneo.obtenerParticipantes '0303456'
            expect(@torneo.participantes[0]).to have_attributes(dni: '0303456')
        end

    end
    context 'Operaciones' do
        it 'actualizarPartidasGanadas' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            @torneo.actualizarPartidasGanadas '0303456', 2
            expect(@torneo.participantes[0]).to have_attributes(dni: '0303456')
        end

        it 'ganador' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            @torneo.ganador
            expect(@torneo.participantes[0]).to have_attributes(dni: '0303456')            
        end

        it 'tablaPosiciones' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            @torneo.tablaPosiciones
            expect(@torneo.participantes[0]).to have_attributes(dni: '0303456')            
        end

        it 'listarEquipos' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            @torneo.listarEquipos
            expect(@torneo.equipos[0]).to have_attributes(codigo: 'EquipoAlfa')
        end
        
        it 'imprimirInfoEquipo' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            @torneo.imprimirInfoEquipo @equipos
            expect(@torneo.equipos[0]).to have_attributes(codigo: 'EquipoAlfa')            
        end

        it 'imprimirInfoParticipante' do
            @torneo = Torneo.new
            @torneo.registrarEquipo 'EquipoAlfa', 'Prueba01'
            @torneo.registrarParticipante 'TK001', 'Juan Carlos', 23, '0303456', 'Negro', 2, 4, 4,'EquipoAlfa'
            @torneo.imprimirInfoEquipo @participantes
            expect(@torneo.participantes[0]).to have_attributes(dni: '0303456')            
        end
    end
end
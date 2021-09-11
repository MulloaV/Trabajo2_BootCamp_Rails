require_relative 'participantes'

RSpec.describe Participantes do
    context "Initialize class participantes" do
        before(:each) do
            @participantes = Participantes.new 'K001','Juan',16,'48763625', 'verde', 2, 4,1,'KZ01'
        end

        it 'new' do
            expect(@participantes).to be_an_instance_of(Participantes)
        end
        it 'codigo' do
            expect(@participantes.codigo).to eq('K001')            
        end
                
        it 'nombre' do
            expect(@participantes.nombre).to eq('Juan')
        end

        it 'edad' do
            expect(@participantes.edad).to eq(16)
        end

        it 'dni' do
            expect(@participantes.dni).to eq('48763625')
        end

        it 'colorCinturon' do
            expect(@participantes.colorCinturon).to eq('verde')
        end

        it 'partidasGanadas' do
            expect(@participantes.partidasGanadas).to eq(2)
        end

        it 'partidasEmpatadas' do
            expect(@participantes.partidasEmpatadas).to eq(4)
        end

        it 'partidasPerdidas' do
            expect(@participantes.partidasPerdidas).to eq(1)
        end
    end
end



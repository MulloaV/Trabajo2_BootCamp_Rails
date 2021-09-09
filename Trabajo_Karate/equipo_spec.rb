require_relative 'equipo'
require_relative 'participantes'

RSpec.describe Equipo do
    context "Inizialize class Equipo" do
        before(:each) do
            @equipo = Equipo.new  'KK01', 'Karate Kid'
        end

        it 'Nuevo' do        
            expect(@equipo).to be_an_instance_of(Equipo)
        end

        it 'codigo' do
            expect(@equipo.codigo).to eq('KK01')
        end 
     

        it 'Nombre' do
            expect(@equipo.nombre).to eq('Karate Kid')
        end

    end
end
    
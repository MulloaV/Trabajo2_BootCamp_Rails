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
        
            
        it 'obtenerEquipo' do 
            #expect(@torneo.obtenerEquipo).to eq('COD01', 'Jose Torres')
            expect(@torneo.obtenerEquipo(@equipo.codigo)).to have_attributes(codigo: 'COD01')
        end
    end    
end    
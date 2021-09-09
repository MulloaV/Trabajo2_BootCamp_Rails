require_relative 'equipo'
require_relative 'participantes'

RSpec.describe Torneo do
    context "Initialize class Torneo" do
        before(:each) do
            @torneo = Torneo.new  ('COD05', 'Carlos Herrera', 25, '65331738', 'marron', 10, 5, 0, 'Equipo03')
        end

        it 'Nuevo' do        
            expect(@torneo).to be_an_instance_of(Torneo)
        end

        it 'obtenerEquipo' do 
            expect(@torneo.obtenerEquipo).to eq('KK01')
        end
    end    
end    
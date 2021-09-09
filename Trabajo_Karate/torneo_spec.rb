require_relative 'equipo'
require_relative 'participantes'

RSpec.describe Torneo
    context "Inizialize class Torneo" do
        before(:each) do
            @torneo = Torneo.new  
        end

        it 'Nuevo' do        
            expect(@torneo).to be_an_instance_of(Torneo)
        end

    end    
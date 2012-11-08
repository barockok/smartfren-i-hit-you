require 'spec_helper'

describe PlanPacket do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'create new one' do
    let(:plan_packet){PlanPacket.new(:code => 'unl1')}
    subject{plan_packet}
    its(:code) do 
      should be_kind_of(String)
      should match(/unl\d/)
    end
    context 'belongs to client_number' do
      let(:client_number){ClientNumber.new}
      before(:each) do
        subject.client_number = client_number
      end
      it 'respond_to?:client_number' do ;  subject.respond_to?(:client_number).should be_true ; end
      it 'client_number == ClientNumber' do ; subject.client_number.should be_kind_of(ClientNumber) ; end
    end
  end
  

    
end

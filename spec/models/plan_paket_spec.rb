require 'spec_helper'

describe PlanPaket do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'create new one' do
    let(:plan_paket){PlanPaket.new(:code => 'unl1')}
    subject{plan_paket}
    its(:code) do 
      should be_kind_of(String)
      should match(/unl\d/)
    end
    context 'belongs to nomor' do
      let(:nomor){Nomor.new}
      before(:each) do
        subject.nomor = nomor
      end
      it 'respond_to?:nomor' do ;  subject.respond_to?(:nomor).should be_true ; end
      it 'nomor == Nomor' do ; subject.nomor.should be_kind_of(Nomor) ; end
    end
    
  end
end

require 'spec_helper'

describe ActivePacket do
  context 'create new activepacket' do
    its(:expired){should be_false}
    context 'nomor' do
      let(:nomor){Nomor.new}
      it 'should respond to nomor' do
        subject.respond_to?(:nomor).should be_true
      end
      
      it 'it nomor must be kind of Nomor' do
        subject.nomor = nomor
        subject.nomor.should be_kind_of(Nomor)
      end
      
      it "it fail when nomer is have't id" do
        subject.nomor = nomor
        # subject.save!
        subject.nomor.id.should be_nil
      end
    end

  end
end

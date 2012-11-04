require 'spec_helper'

describe ActivePacket do
  context 'create new activepacket' do
    it '.expired be false' do ; subject.expired.should be_false ; end
    it '.respond_to? :client_number' do
      subject.respond_to?(:client_number).should be_true
    end
    context '.client_number' do
      let(:client_number){ClientNumber.new}
      it 'it client_number must be kind of ClientNumber' do
        subject.client_number = client_number
        subject.client_number.should be_kind_of(ClientNumber)
      end
      
      it "it fail when client_number is have't id" do
        subject.client_number = client_number
        # subject.save!
        subject.client_number.id.should be_nil
      end
    end

  end
end

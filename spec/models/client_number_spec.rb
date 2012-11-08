require 'spec_helper'

describe ClientNumber do
  
  context "create new one" do
    let(:client_number){ClientNumber.new({:nomer => '129123102', :password => 'alzid4ever'})}
    subject{client_number}
    its(:auto_subscribe){ should be_false} 
    its(:nomer){should be_kind_of(String)}
    its(:password){should be_kind_of(String)} 

    context ".api" do
      subject{client_number.api}
      it "kind of SmartfrenCore::Client" do
        subject.should be_kind_of(Smartfren::Client)
      end
      it ".respond_to?:login" do ; subject.respond_to?(:login).should be_true ; end
      context " when login " do
        
      end  
    end
    context "when buy" do
      it "mock the api.buy" do
        subject.api.expects(:buy).with('daily').returns(true)
        subject.buy('daily')
      end
      it "should raise code error when code not avail" do
        subject.api.stubs(:buy).with('asuh').raises(Smartfren::Error::WrongCode)
        expect{subject.buy('asuh')}.to raise_error(Smartfren::Error::WrongCode)
      end
      
    end
  end
  
  
end

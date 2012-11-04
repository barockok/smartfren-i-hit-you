require 'spec_helper'

describe ClientNumber do
  
  context "create new one" do
    let(:client_number){ClientNumber.new({:nomer => '129123102', :password => 'alzid4ever'})}
    subject{client_number}
    its(:auto_subscribe){ should be_false} 
    its(:nomer){should be_kind_of(String)}
    its(:password){should be_kind_of(String)} 
  end
end

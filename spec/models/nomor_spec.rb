require 'spec_helper'

describe Nomor do
  
  context "create new one" do
    let(:nomor){Nomor.new({:nomer => '129123102', :password => 'alzid4ever'})}
    subject{nomor}
    its(:auto_subscribe){ should be_false} 
    its(:nomer){should be_kind_of(String)}
    its(:password){should be_kind_of(String)} 
  end
end

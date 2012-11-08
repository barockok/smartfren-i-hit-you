require 'spec_helper'

describe PlanPacket do
  before(:each){
    @plan_packet = FactoryGirl.create(:plan_packet)
    @clinet_number = FactoryGirl.create(:client_number)
    @plan_packet.client_number = @clinet_number
    @plan_packet.save
  }
  context 'when create new' do
    it " should belongs to a client number " do
      @plan_packet.respond_to?(:client_number).should be_true
    end
    it "should belong to right client number" do
      @plan_packet.client_number.nomer.should == @clinet_number.nomer
    end
  end
  context "Mock SF Client buy" do
    it("should fine"){
       Smartfren::Client.any_instance.expects(:buy).returns(true)
       @sf = Smartfren.connect('XXX', 'XXXX')
       @sf.buy
    }
  end
  context 'when check apply' do
    context "then found one" do
      before(:each){
        create_sample
        @plan_packet.update_attribute(:will_subscribe_at , Time.now)
        #stub Smartfren::Client instance buy
        Smartfren::Client.any_instance.stubs(:buy).returns(true)
        PlanPacket.check_apply
      }
      
      it "should have one archived" do
        @plan_packet.reload.archive.should be_true
      end
      context "then have one active packet" do
        it "should belongs to right planpacket" do
          ActivePacket.find_by_plan_packet_id(@plan_packet.id).plan_packet.id.should == @plan_packet.id
        end
      end
    end
  end
  def create_sample
    20.times{FactoryGirl.create(:plan_packet)}
  end
end

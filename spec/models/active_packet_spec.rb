require 'spec_helper'

describe ActivePacket do
  context 'create new activepacket' do
    let(:client_number){ClientNumber.new}
    its(:expired){should be_false}
    it '.respond_to? :client_number' do
      subject.respond_to?(:client_number).should be_true
    end
  end
  context 'when checking_expired' do
    it "should find one" do
      #build little coll non expired
      build_20_activepacket
      #select random one, which wil be set as expired
      target = ActivePacket.last;
      target.update_attribute(:will_expired, (Time.now-2.minute))
      ActivePacket.check_expired
      ActivePacket.where(:expired => true).count.should == 1
    end
    it "should find two" do
      #build little coll non expired
      build_20_activepacket
      #select random one, which wil be set as expired
      target = ActivePacket.limit(2);
      target.each{|ap| ap.update_attribute(:will_expired, (Time.now-2.minute)) }
      ActivePacket.check_expired
      ActivePacket.where(:expired => true).count.should == 2
    end
    context 'when found' do
      it "should mark expired as true " do
        build_20_activepacket
        target = ActivePacket.last
        target.update_attribute(:will_expired, (Time.now-2.minute))
        ActivePacket.check_expired
        target.reload.expired.should be_true
      end
    end
  end
  context 'when five_minutes_togo_expired' do
    before(:each){build_20_activepacket}
    it("should be_true if found"){
      ActivePacket.last.update_attribute(:will_expired , Time.now+5.minute)
      ActivePacket.five_minutes_togo_expired.should be_true
    }
    it("should mark as notified"){
      target = ActivePacket.last
      target.update_attribute(:will_expired , Time.now+5.minute)
      ActivePacket.five_minutes_togo_expired
      target.reload.notified.should be_true
    }
    it("should be_false if found under 4 minutes"){
      ActivePacket.last.update_attribute(:will_expired , Time.now+4.minute)
      ActivePacket.five_minutes_togo_expired.should be_false
    }
    it("should be_false if found above 6 minutes"){
      ActivePacket.last.update_attribute(:will_expired , (Time.now+6.minute)+1.second)
      ActivePacket.five_minutes_togo_expired.should be_false
    }
  end
  
  describe "Test DatabaeCleaner and FactoryGirl work fine " do
    let(:ap1){FactoryGirl.create(:active_packet)}
    let(:ap2){FactoryGirl.create(:active_packet); FactoryGirl.create(:active_packet)}
    it('should create active_packet with id == 1'){ap1.id.should == 1 }
    it('should create active_packet with id == 2'){ap2.id.should == 2 }
  end
  
  
  
  def build_20_activepacket
     20.times{|i|FactoryGirl.create(:active_packet, :will_expired => (Time.now+(1+i).day))}
  end
end

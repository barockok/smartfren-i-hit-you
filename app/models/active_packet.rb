class ActivePacket < ActiveRecord::Base
  attr_accessible :code, :expired, :nomor_id, :will_expired, :notified
  belongs_to :client_number
  
  def self.five_minutes_togo_expired
    range = (Time.now+4.minute)..(Time.now+6.minute)
    list = ActivePacket.where(:will_expired =>  range)
    list.each{|ap| ap.notify_will_expired}
    
    list.size > 0 ? true : false
  end
  
  def self.mark_as_expired list
    list.each{|ap| ap.update_attribute(:expired , true)}
  end
  
  def notify_will_expired
    update_attribute(:notified, true)
  end
  def trigger_expired
    #set ass expired, notify user
  end
  
  def self.check_expired
    list = ActivePacket.where('will_expired < ?', Time.now)
    if list.size > 0
      mark_as_expired list
      true
    end 
  end
end

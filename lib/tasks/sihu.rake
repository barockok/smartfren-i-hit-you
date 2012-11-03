namespace :sihu do
  desc "Daftar nomer"
  task :daftar_nomor , [:nomor, :password] => :enviroment do |t , args|
    
  end
  
  desc "Daftar Paket"
  task :daftar_paket, [:nomor, :time] => :enviroment do
  
  end
  
  desc "Check Packet"
  task :check_packet, [:nomor] => :enviroment do
  end
  
  task :default do
    puts "
    SIHU - (Smartfren I hit You)
    cara pemakaian :
    rake sihu:daftar_nomor [nomer] [password]
    rake sihu:daftar_packe [nomer] [code] [time]
    "
  end
  
  def daftar_nomor nomor, password
  
  end
  
  def dafter_packet nomor, code , time=false
  end
  
  def check_packet nomor
    
  end
  
  
end
desc "SIHU"
task :sihu => 'sihu:default'

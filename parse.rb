#!/usr/bin/ruby

def parse_data(write_file="./outfile", filea=ARGV[0], fileb=ARGV[1], filec=ARGV[2], filed=ARGV[3], filee=ARGV[4])

  ip = IO.readlines(filea)
  ip_len = ip.length

  fqdn = IO.readlines(fileb)
  fqdn_len = fqdn.length 

  mac = IO.readlines(filec)
  mac_len = ip.length

  env = IO.readlines(filed)
  env_len = ip.length

  host = IO.readlines(filee)
  host_len = ip.length

  ip_len.times do |count|  
     csv_file = File.open(write_file, "a") 
     csv_file.puts "mysql -e \"insert into server values \(\'#{host[count].strip}\',\'#{env[count].strip}\',\'db\',\'YES\',\'#{mac[count].strip}\',\'#{ip[count].strip}\',\'#{fqdn[count].strip}\'\)\""
  end
end


def check_args 
  if ARGV.length == 0
      abort "\nError: Please provide the files to parse...\n\n"
  elsif ARGV.length < 2
      abort "\nError: The script takes 2 arguments: file1 file2...\n\n"
  end
  if File.exists?(ARGV[0]) && File.exists?(ARGV[1]) 
    return true
  else
    puts "please provide valid input files"
  end
end

check_args 
parse_data

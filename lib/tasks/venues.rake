namespace :venues do
  task load: :environment do
    f = File.read("#{Rails.root}/db/333.csv")

    lines = f.split("\n")

    lines.each do |line|
      data = line.split(';')
      name = data[1]
      address = data[3]
      phones = data[4]

      puts "#{name} | #{address} | #{phones}"

      Place.create(name: name, address: address, phones: phones)
    end
  end
end
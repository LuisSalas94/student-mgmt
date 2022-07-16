class AddDummyRecordsToDemoTable < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
      10.times do |i|
      puts "Creating demo #{i+1}"
      Demo.create(
        title: "Demo title #{i+1}",
        description: "Title Description #{i+1}"
      )
      end
    end

      dir.down do
      10.times do |i|
      puts "Deleting demo #{i+1}"
      Demo.find_by(title: "Demo title #{i+1}").destroy
      end
    end
  end
 end
end

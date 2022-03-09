class Load
   def self.transmit_and_check
      @start=Time.now()

      @file = File.open("#{Rails.root}/app/assets/items/Items.xml")

      puts "Обработка файла с базовой информацией по товарам..."
      create_new_items_table(@file)

      puts "Время выполнения: "+(Time.now().to_f-@start.to_f).round().to_s+"сек"
   end

   def self.create_new_items_table(file)
      @doc = Hash.from_xml(file)
      ActiveRecord::Migration[5.0].drop_table(:items)
      ActiveRecord::Migration[5.0].create_table(:items) do |t|
         t.string :item
         t.string :category
         t.string :begin_price
         t.string :price
         t.integer :quantity 
   
         t.timestamps
      end
      @doc["Items"]["Item"].each do |item|
         @data = Item.new()
         @data.item = item["Name"]
         @data.category = item["Category"]
         @data.begin_price = item["Cost"]
         @data.price = (item["Cost"].to_f * item["Quantity"].to_f).floor(2)
         @data.quantity = item["Quantity"]
         @data.save
      end
   end
end
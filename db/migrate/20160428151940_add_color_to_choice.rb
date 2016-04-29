require 'color-generator'

class AddColorToChoice < ActiveRecord::Migration
  def change
    generator = ColorGenerator.new saturation: 0.3, lightness: 0.75
    add_column :choices, :color, :string, default: generator.create_hex
  end
end

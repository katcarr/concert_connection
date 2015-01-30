class CreateVenuesBandsAndJoin < ActiveRecord::Migration
  def change
    create_table(:venues) do |t|
      t.column(:name, :string)
      t.timestamps
    end

    create_table(:bands) do |t|
      t.column(:name, :string)
      t.timestamps()
    end

    create_table(:bands_venues) do |t|
      t.belongs_to :band, index: true
      t.belongs_to :venue, index: true
      t.timestamps()
    end
  end
end

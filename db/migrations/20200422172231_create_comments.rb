Hanami::Model.migration do
  change do
    create_table :comments do
      primary_key :id
      foreign_key :post_id, :posts, on_delete: :cascade, null: false

      column :body, String, null: false, text: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:documents) do
      primary_key :id
      foreign_key :user_id, table: :users

      String :filename, null: false
      String :relative_path, null: false, default: ''
      String :description
      String :content, null: false, default: ''

      DateTime :created_at
      DateTime :updated_at

      unique [:user_id, :relative_path, :filename]
    end
  end
end

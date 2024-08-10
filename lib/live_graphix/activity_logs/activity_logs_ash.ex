defmodule LiveGraphix.ActivityLogs.ActivityLogAsh do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "activity_logs"
    repo LiveGraphix.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :user_id, :uuid
    attribute :type, :string
    attribute :linked_type, :string
    attribute :linked_id, :uuid
    attribute :old, :map
    attribute :new, :map
    attribute :created_at, :naive_datetime
    attribute :updated_at, :naive_datetime
  end
end

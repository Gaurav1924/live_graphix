defmodule LiveGraphix.ActivityLogs.ActivityLog do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}
  schema "activity_logs" do
    field :user_id, :binary_id
    field :type, :string
    field :linked_type, :string
    field :linked_id, :binary_id
    field :old, :map
    field :new, :map
    field :created_at, :naive_datetime
    field :updated_at, :naive_datetime

  end

  @doc false
  def changeset(activity_log, attrs) do
    activity_log
    |> cast(attrs, [:user_id, :type, :linked_type, :linked_id, :old, :new, :created_at, :updated_at])
    |> validate_required([:id])
  end
end

defmodule Zaq.Repo.Migrations.MakeChannelConfigFieldsNullable do
  use Ecto.Migration

  def change do
    alter table(:channel_configs) do
      modify :url, :string, null: true
      modify :token, :string, null: true
    end
  end
end

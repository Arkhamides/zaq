alias Zaq.Repo
alias Zaq.Accounts.Role
alias Zaq.Channels.ChannelConfig

roles = ["super_admin", "admin", "staff", "public"]

Enum.each(roles, fn name ->
  unless Repo.get_by(Role, name: name) do
    Repo.insert!(%Role{name: name, meta: %{}})
  end
end)

# Seed ZAQ Local ingestion channel
unless Repo.get_by(ChannelConfig, provider: "zaq_local") do
  Repo.insert!(%ChannelConfig{
    name: "ZAQ Local",
    provider: "zaq_local",
    kind: "ingestion",
    enabled: true
  })
end

# Prompt templates are seeded in migration 20260316204749.

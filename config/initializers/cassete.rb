Cassette.config = OpenStruct.new(
  username: ApiStub.config.systems_cas.username,
  password: ApiStub.config.systems_cas.password,
  service: ApiStub.config.systems_cas.service,
  base: ApiStub.config.systems_cas.base,
  base_authority: ApiStub.config.systems_cas.base_authority,
  verify_ssl: false,       # If not defined, the default value will be: false.
)

# Cassette::Cache.backend = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 5.minutes }
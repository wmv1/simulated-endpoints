Cassette.config = OpenStruct.new(
  username: ApiStub.config.systems_cas.username,
  password: ApiStub.config.systems_cas.password,
  service: ApiStub.config.systems_cas.service,
  base: ApiStub.config.systems_cas.base,
  base_authority: ApiStub.config.systems_cas.base_authority,
  tls_version: ApiStub.config.systems_cas.tls_version,
  verify_ssl: false,       # If not defined, the default value will be: false.
)

# See https://concourse-ci.org/vault-credential-manager.html for implementation of Vault as secret manager

make-concourse-cert:
	certstrap init --cn vault-ca
	certstrap request-cert --domain vault --ip 127.0.0.1
	certstrap sign vault --CA vault-ca
	certstrap request-cert --cn concourse
	certstrap sign concourse --CA vault-ca
	mkdir -p vault/certs
	mv out/* vault/certs

init-vault:
	VAULT_CACERT=vault/certs/vault-ca.crt vault operator init

unseal-vault:
	VAULT_CACERT=vault/certs/vault-ca.crt vault operator unseal

vault-write-policy:
	VAULT_CACERT=vault/certs/vault-ca.crt vault policy write concourse ./vault/concourse-policy.hcl

vault-enable-cert-backend:
	export VAULT_CACERT=vault/certs/vault-ca.crt
	vault auth enable cert
	vault write auth/cert/certs/concourse \
		policies=concourse \
		certificate=@vault/certs/vault-ca.crt \
		ttl=1h
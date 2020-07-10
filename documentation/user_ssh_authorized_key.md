# user_ssh_authorized_key

[Back to resource list](../README.md#resources)

## Actions

- `:create`
- `:delete`

## Properties

| Name                   | Type          | Default                          | Description                                                         | Allowed Values      |
| ---------------------- | ------------- | -------------------------------- | ------------------------------------------------------------------- | ------------------- |
| `cookbook`             | String        | `user_ssh`                       | Cookbook to source authorized_keys file template from               |                     |
| `template`             | String        | `authorized_keys.erb`            | Template to use to generate the authorized_keys file                |                     |
| `user`                 | Integer, String | None                           | Owner of the generated authorized_keys file                         |                     |
| `group`                | Integer, String | None                           | Group of the generated authorized_keys file                         |                     |
| `mode`                 | String        | `'0600'`                         | Filemode of the generated authorized_keys file                      |                     |
| `home`                 | String        | User home directory              | User home directory path                                            |                     |
| `options`              | String, Array | None                             | Array of strings containing authorized key options                  |                     |
| `keytype`              | String        | `'ssh-rsa'`                      | SSH key type                                                        | `'ecdsa-sha2-nistp256' 'ecdsa-sha2-nistp384' 'ecdsa-sha2-nistp384' 'ecdsa-sha2-nistp521' 'ssh-ed25519' 'ssh-dss' 'ssh-rsa'` |
| `key`                  | String        | None                             | SSH public key as a base64 string                                   |                     |
| `comment`              | String        | None                             | SSH public key comment to add to authorized_keys file               |                     |
| `validate_key`         | `true`, `false` | `true`                         | Test SSH public key format against regex                            |                     |

# CHANGELOG

## v0.2.2 (2021-04-08)

- Fix home directory creation with incorrect owner/group

### Fixed

- Correct `.ssh` directory permissions

## v0.2.1 (2020-10-12)

### Fixed

- Correct `.ssh` directory permissions

## v0.2.0 (2020-09-18)

### Changed

- Change SSH key file generation to use user primary group by default

## v0.1.0 (2020-07-10)

## Added

- Initial release
- Provides `user_ssh_authorized_key` to manage user SSH authorized keys
- Provides `user_ssh_known_host` to manage user SSH known hosts

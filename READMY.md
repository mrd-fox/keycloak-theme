# Skillshub – Keycloak (IAM Module)

This module contains the Identity and Access Management configuration for the Skillshub platform.

It is responsible for:
- Authentication (OIDC)
- Role management
- Token issuance (JWT)
- Login / registration flows
- Integration with Gateway

This repository DOES NOT contain:
- User accounts
- Passwords
- Client secrets
- Private realm export files

Realm JSON exports are considered sensitive and must never be committed.

---------------------------------------------------------------------

1️⃣ Architecture Position

Skillshub authentication flow:

Client
→ HTTPS
→ Caddy (reverse proxy + TLS)
→ Keycloak
→ Gateway
→ Backend

Public endpoint:
https://skillshubdev-auth.duckdns.org

Internal container address:
http://keycloak:8080

Keycloak is NOT exposed publicly on port 8080.

---------------------------------------------------------------------

2️⃣ Realm Requirements (MANDATORY)

The following realm must exist:

Realm Name:
skillshub

This name is required by Gateway configuration and must not change.

---------------------------------------------------------------------

3️⃣ Required Realm Roles

The realm MUST contain the following roles:

- STUDENT
- TUTOR
- ADMIN

These roles are used by:
- Gateway for authorization
- Backend for role-based access control
- Frontend for dashboard routing

---------------------------------------------------------------------

4️⃣ Required Clients

4.1 frontend-skillshub

Type: Public client

Required configuration:
- Standard flow enabled
- Direct access grants enabled
- Redirect URIs:
    - http://localhost:5173/*
    - https://skillshubdev-auth.duckdns.org/*
- Web origins:
    - http://localhost:5173
    - https://skillshubdev-auth.duckdns.org

---------------------------------------------------------------------

4.2 gateway-service

Type: Public client (current MVP)

Required configuration:
- Direct access grants enabled
- Used internally by Gateway
- No client secret required for MVP

---------------------------------------------------------------------

5️⃣ Proxy Configuration (Important)

Keycloak runs behind Caddy reverse proxy.

Required Keycloak environment configuration:

KC_HTTP_ENABLED=true
KC_PROXY_HEADERS=xforwarded
KC_HOSTNAME=<public hostname>
KC_HOSTNAME_STRICT=true

Caddy must forward:
- X-Forwarded-Proto=https
- X-Forwarded-Host
- X-Forwarded-Port=443

Failure to configure proxy correctly will cause:
- Redirects to :8080
- Mixed HTTP/HTTPS issues
- Invalid issuer values

---------------------------------------------------------------------

6️⃣ OIDC Validation Contract

The following endpoint must be reachable publicly:

https://skillshubdev-auth.duckdns.org/realms/skillshub/.well-known/openid-configuration

The issuer must be:

https://skillshubdev-auth.duckdns.org/realms/skillshub

Gateway MUST use this exact issuer URI.

---------------------------------------------------------------------

7️⃣ Database

Keycloak uses a dedicated PostgreSQL database.

Security model:
- Not publicly exposed
- Accessible only inside Docker network
- Optional localhost binding for DEV debugging only

---------------------------------------------------------------------

8️⃣ Themes

Custom themes are mounted at:
/opt/keycloak/themes

Realm must be configured manually to use the custom login theme.

Theme files are version-controlled.
User data is not.

---------------------------------------------------------------------

9️⃣ What Must NOT Be Committed

Never commit:
- Realm full export JSON
- User accounts
- Password hashes
- Client secrets
- SMTP credentials
- Production env files

This repository defines structure and requirements only.

---------------------------------------------------------------------

10️⃣ Deployment Model

Keycloak runs via Docker Compose.

It joins the shared Docker network:
skillshub-net

It must be deployed alongside the main stack but in a separate compose file.

---------------------------------------------------------------------

11️⃣ Current Status

✔ Realm name fixed
✔ Required roles defined
✔ Required clients defined
✔ Proxy integration stable
✔ OIDC issuer validated
✔ HTTPS enforced

This module is ready for Gateway integration.

---------------------------------------------------------------------

12️⃣ Responsibility Boundary

Keycloak:
- Authenticates users
- Issues tokens

Gateway:
- Validates tokens
- Handles refresh tokens
- Propagates user metadata

Backend:
- IAM-agnostic
- Trusts Gateway headers only
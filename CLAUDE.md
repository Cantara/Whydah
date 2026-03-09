# Whydah

## Purpose
Top-level umbrella repository for the Whydah Identity and Access Management (IAM) and Single Sign-On (SSO) solution. Provides project-level documentation, architectural overviews, Docker quickstart, and build status dashboards for all Whydah components.

## Tech Stack
- Language: N/A (documentation and Docker compose only)
- Build: N/A
- Docker: `whydah/whydah-all-in-one-image` for local development

## Architecture
Whydah is a distributed IAM/SSO system composed of multiple microservices:
- **Core:** SSOLoginWebApp, SecurityTokenService (STS), UserAdminService (UAS), UserIdentityBackend (UIB), UserAdminWebApp (UAW)
- **SDKs:** Whydah-Java-SDK, Whydah-Admin-SDK, Whydah-TypeLib
- **Extensions:** CRMService, StatisticsService, OAuth2Service, SPAProxyService
- **Example:** TestWebApp with integration examples (JavaScript, Django, SharePoint, Spring Security, Mobile)

## Key Entry Points
- `README.md` - Full component listing with build status
- Docker quickstart for all-in-one local deployment
- http://getwhydah.com - Feature overview
- https://wiki.cantara.no/display/whydah/ - Architecture and development docs

## Development
```bash
# Quick start with Docker
docker pull whydah/whydah-all-in-one-image
docker run -it -p 80:9999 -p 9990:9990 -p 9992:9992 -p 9995:9995 -p 9996:9996 -p 9997:9997 -p 9998:9998 whydah/whydah-all-in-one-image

# Verify
curl http://localhost:9998/tokenservice/health
curl http://localhost:9997/sso/health
curl http://localhost:9992/useradminservice/health
```

## Domain Context
Enterprise identity and access management. Whydah provides user management, application management, role-based access control (RBAC), SSO, OAuth2/OpenID Connect, and flexible integration points for enterprise applications.

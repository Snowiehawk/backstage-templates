# Homelab Catalog Standards

This page is the source of truth for how we model things in Backstage.

## Fast cheat sheet

| Kind | Use it for | Example |
| --- | --- | --- |
| Component | Software or a service you run | `openwebui`, `jellyfin`, `backstage` |
| Resource | Infrastructure the software depends on at runtime | `openwebui-vm`, `pve-ai`, `postgres-backstage`, `nas-media-share` |
| System | A related set of components, resources, and APIs | `homelab`, `ai-stack`, `media-stack` |
| Domain | A larger grouping above systems | `homelab`, `ai`, `media`, `networking` |
| API | An interface exposed or consumed by a component | `openwebui-api` |
| Group | A team or logical owner | `guests` |
| User | A person | `noah` |
| Template | A scaffolder recipe that creates catalog content | `homelab-service` |
| Location | A catalog registration source | `homelab-catalog` |

## Rules

1. If it is software you run, model it as a **Component**.
2. If it is infrastructure that software needs, model it as a **Resource**.
3. If it groups related components and resources, model it as a **System**.
4. If it groups multiple systems, model it as a **Domain**.
5. Ownership should point to a **Group** or **User**, never random freeform text.

## Examples

- OpenWebUI = **Component**
- OpenWebUI VM = **Resource**
- Homelab = **System**
- Guests = **Group**

## Shared docs policy

- Shared catalog standards live in this repo.
- Service-specific runbooks should live in the repo that owns that service or infra.
- When multiple entities should show the same docs, point them to one shared TechDocs source.

## How to add docs to a real service later

For service-specific docs, keep the docs with the repo that owns the service or infrastructure.

Minimum shape:

- entity YAML with `backstage.io/techdocs-ref: dir:.`
- `mkdocs.yml`
- `docs/index.md`

## Notes for future me

When in doubt:

- Browser app, API server, daemon, web UI = **Component**
- VM, LXC, host, database, bucket, share, cluster = **Resource**
- Bundle of related runtime things = **System**
- Bigger umbrella over multiple systems = **Domain**